module Morpheus
  class FindTask
    def self.where(options)
      task_name = options[:task_name].to_sym
      tasks = Morpheus.application.tasks
      tasks.select { |task| task.name == task_name }
    end
  end
end