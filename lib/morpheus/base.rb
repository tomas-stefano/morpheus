module Morpheus
  class Base
    include Shell

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
    def self.task(task_name, &block)
      Morpheus::Task.new(namespace: self, task_name: task_name, &block)
    end

  end
end