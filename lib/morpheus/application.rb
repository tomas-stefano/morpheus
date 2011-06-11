module Morpheus
  class Application
    attr_accessor :tasks

    def initialize
      @tasks = {}
    end

    # Add task to application Object
    #
    # ==== Parameters
    # task<Task>:: the task object.
    #
    # ==== Example
    #
    #   task = Task.new(task_name: :my_task, namespace: :default, &block)
    #   add_task(task) # => { :default => [ task ] }
    #
    def add_task(task)
      @tasks[task.namespace] ||= []
      @tasks[task.namespace].push(task)
    end

  end
end