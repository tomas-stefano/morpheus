module Morpheus
  class Base
    include Shell

    class << self

      # Everytime someone inherits from Morpheus::Base class, register the klass into baseclass.
      #
      def inherited(klass)
        subclasses.push(klass)
        Namespace.new(:class_name => klass)
      end

      # Every method in the scope of a Base subclass is a task
      #
      # TODO: Do something wib children of subclasses of Morpheus::Base
      #
      def method_added(method_name)
        if self.superclass.equal?(Morpheus::Base)
          Morpheus::Task.new(namespace: self, task_name: method_name)
        end
      end

      # Returns the classes that inherits from Morpheus::Base
      #
      # ==== Returns
      # Array[Class]
      #
      def subclasses
        @subclasses ||= []
      end
      alias :namespaces :subclasses

      # Create a Morpheus Task
      #
      # ==== Parameters
      # task_name<String>:: the name of the task to be executed.
      # block<Proc>:: passing a block that will be executed in the command line
      #
      # ==== Example
      #
      #   task :vendor do
      #     run 'ln -s ~/edge rails'
      #   end
      #
      def task(task_name, &block)
        Morpheus::Task.new(namespace: self, task_name: task_name, &block)
      end

      # Adds an option to the set of class options
      #
      # ==== Parameters
      # options<Hash>:: Described below.
      #
      def options(user_options)
        Morpheus::OptionsParser.new(user_options)
      end

    end

    def options
      { "dont" => "drink" }
    end
  end
end