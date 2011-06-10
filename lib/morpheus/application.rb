module Morpheus
  class Application
    attr_accessor :tasks
    
    def initialize
      @tasks = {}
    end
    
    def add_task(task)
      @tasks[task.namespace] ||= []
      @tasks[task.namespace].push(task)
    end
  end
end