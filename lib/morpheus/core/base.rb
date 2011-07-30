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
      
      # Uses the singleton pattern. I prefer to do it myself instead uses the singleton ruby stdlib 
      #
      # ==== Returns
      # Base[Class] or self[Class]
      #
      def instance
        @instance ||= new
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
        ProvidedTask.new(subclass, self).create_method
      end
      
      # Return tasks for the current subclass
      #
      # ==== Returns
      # Array[Class]
      #
      def tasks
        @tasks ||= []
      end
      
      # Add task as a namespace of the self scope
      #
      # ==== Returns
      # Task[Class]
      #
      def add_task(*args)
        self.tasks.push(Task.new(*args, :namespace => self))
      end
      
      # Find task by name in the self scope.
      #
      # ==== Returns
      # Task[Class]
      #
      def find_task(task_name)
        tasks.find { |task| task.name.equal?(task_name) }
      end
      
      # Set another Description class that will be used to parse the description in the self scope.
      #
      def description=(description_class)
        @description = description_class
      end
      
      # Will find the description class to be used for the self scope when creating a task
      #
      # ==== Examples
      # 
      #   class Mydescrition < Morpheus::Descrition
      #     def parse!
      #       # ... put your logic here!
      #       # puts self
      #     end
      #   end
      #
      #   class Tasks < Morpheus::Base
      #     description MyDescription
      #   end
      #
      # The description class for Tasks scope is MyDescription
      #
      def description(description_class=nil)
        if description_class
          self.description = description_class
        end
        @description || Morpheus::Description
      end
      
      # SIGNATURE: Be possible to users defines behavior when the method is added to the class.
      #
      def create_task(task_name)
      end
    end
  end
end