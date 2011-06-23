module Morpheus
  class Task
    attr_accessor :namespace, :name, :block

    def initialize(task_name, options, &action)
      @name = task_name
      @namespace = options[:namespace]
      @block     = action
      Morpheus.application.add_task self, :to_namespace => namespace
    end
  end
end