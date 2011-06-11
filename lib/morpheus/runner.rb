module Morpheus
  class Runner
    attr_accessor :argument, :loader_tasks, :application

    def initialize(command_line_arguments)
      @argument     = command_line_arguments.shift.to_sym
      @application  = Morpheus.application
    end

    def run!
      load_task_file
      send(argument)
    end

    def load_task_file
      load(File.expand_path('Tasks', Dir.pwd))
    end

    # List the available Morpheus Tasks
    #
    def list
      verify_if_tasks_exist!
      print_all_tasks!
    end

    private
      def verify_if_tasks_exist!
        if application.tasks.empty?
          puts "No Morpheus tasks available"
          exit(1)
        end
      end

      def print_all_tasks!
        application.tasks.keys.each_with_index do |namespace, index|
          puts if index > 0
          puts "Namespace: #{namespace}"
          puts '-' * (11 + namespace.name.size)
          application.tasks[namespace].each do |task|
            puts "task :#{task.task_name} # Without Description"
          end
        end
      end

  end
end