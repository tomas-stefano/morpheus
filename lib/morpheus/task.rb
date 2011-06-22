module Morpheus
  class Task
    attr_accessor :namespace, :task_name, :block

    def initialize(options, &action)
      @namespace = options[:namespace]
      @task_name = options[:task_name]
      @block     = action
      Morpheus.application.add_task self, :to_namespace => namespace
    end
  end
end