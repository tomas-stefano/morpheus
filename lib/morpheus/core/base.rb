module Morpheus
  class Base
    class << self
      # Everytime someone inherits from Morpheus::Base class, register the klass into baseclass.
      #
      def inherited(klass)
        Base.register_filename_for(klass)
        subclasses.push(klass)
      end

      # Everytime someone add a instance method in Morpheus::Base subclass, register the method as a task.
      # Don't include private or protected methods as a task.
      #
      def method_added(__method_name__)
        return unless public_instance_methods.include?(__method_name__) or public_instance_methods.include?(__method_name__.to_sym)
        create_task(__method_name__) # SIGNATURE
        add_task(__method_name__)
      end

      # Returns the classes that inherits from Morpheus::Base
      #
      # ==== Returns
      # Array[Class]
      #
      def subclasses
        @subclasses ||= []
      end
      
      # When a class inherits from Morpheus::Base, we should track the class and the file for the class.
      #
      def register_filename_for(klass)
        filenames[klass] = File.expand_path(caller[1].match(/(.*):\d+/)[1])
      end
      
      # ==== Returns
      # Hash[Class]
      #
      def filenames
        @filenames ||= {}
      end
      
      # ==== Returns
      # String[Create]
      #
      def filename
        Base.filenames[self]
      end
      
      # Create a method in the Morpheus::Base scope and when it call a method creating a Morpheus::Task
      #
      # ==== Returns
      # TrueClass[Class]
      #      
      def create_method(subclass)
        _method_name_ = subclass.method_name
        Base.instance_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{_method_name_}(*args)
            args.unshift("#{subclass.method_name}")
            args.last << {:description => ''}
            args.last[:namespace] = self
            self.add_task(args) # TODO: Put a description method
          end
        RUBY
        true
      end
      
      # Return tasks for the current subclass
      #
      # ==== Returns
      # Array[Class]
      #
      def tasks
        @tasks ||= []
      end
      
      def add_task(*args)
        if args.last.respond_to?(:store)
          args.last.store(:namespace, self)
        else
          args << {:namespace => self}
        end
        self.tasks.push(Task.new(*args))
      end
      
      # Find task by name in the self scope.
      #
      # ==== Returns
      # Task[Class]
      #
      def find_task(task_name)
        tasks.find { |task| task.name.equal?(task_name) }
      end
      
      # SIGNATURE: Be possible to users defines behavior when the method is added to the class.
      #
      def create_task(task_name)
      end
    end
  end
end