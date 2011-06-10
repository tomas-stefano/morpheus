module Morpheus
  class Runner
    attr_accessor :argument, :loader_tasks, :application
    
    def initialize(command_line_arguments)
      @argument     = command_line_arguments.shift.to_sym
      @loader_tasks = LoaderTasks.new
      @application  = Morpheus.application 
    end
    
    def run!
      send(argument)
    end
    
    # REFACTOR ME: THis is code just for all tests pass (Now I will commit and sleep)
    #
    def list
      all_tasks = application.tasks
      if all_tasks.empty?
        puts "No Morpheus tasks available"
        exit(1)
      end
      all_tasks.keys.each_with_index do |namespace, index|
        puts if index > 0
        puts "Namespace: #{namespace}"
        puts '-' * (11 + namespace.name.size)
        all_tasks[namespace].each do |task|
          puts "task :#{task.task_name} # Without Description"
        end
      end
    end
    
  end
end