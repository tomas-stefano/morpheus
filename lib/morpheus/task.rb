module Morpheus
  class Task
    attr_accessor :namespace, :name, :block

    def initialize(task_name, options, &action)
      @name = task_name
      @namespace = options[:namespace]
      @is_a_method = options[:is_a_method?] || false
      @block     = action
      @namespace_instance = namespace.method(:new).call # TODO: begin ... rescue in case users define initialize methods
      application.add_task self, :to_namespace => namespace
    end

    def is_a_method?
      @is_a_method
    end

    def invoke
      if is_a_method?
        @namespace_instance.method(name).call
      else
        call_block
      end
    end

    def call_block
      if block
        @namespace_instance.instance_eval(&block)
      else
        application.task_without_a_block!
      end
    end

    def application
      Morpheus.application
    end
  end
end