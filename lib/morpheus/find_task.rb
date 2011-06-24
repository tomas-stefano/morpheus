module Morpheus
  class FindTask
    def self.where(options)
      task_name = options[:task_name].to_sym
      tasks = Morpheus.application.tasks
      if is_using_namespace?(task_name)
        namespace, task_name = task_name.to_s.split(':')
        tasks.select { |task| task.namespace == Namespace.class_for(namespace) and task.name == task_name.to_sym }
      else
        tasks.select { |task| task.name == task_name }
      end
    end

    def self.is_using_namespace?(task_name)
      task_name.to_s.include?(':')
    end
  end
end