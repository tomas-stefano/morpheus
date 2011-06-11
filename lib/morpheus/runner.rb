module Morpheus
  class Runner
    attr_accessor :argument, :loader_tasks, :application

    include Shell

    def initialize(command_line_arguments)
      @argument     = command_line_arguments.shift.to_sym
      @application  = Morpheus.application
    end

    # Run! from command line
    def run!
      load_task_file
      begin
        send(argument)
      rescue
        invoke(argument)
      end
    end

    def load_task_file
      load(File.expand_path('Tasks', Dir.pwd))
    end

    # List the available Morpheus Tasks
    #
    def list
      if application.tasks.empty?
        say "No Morpheus tasks available"
        exit(1)
      end
      print_all_tasks!
    end

    # Invoke the given namespace or class given. It adds an instance
    # method that will invoke the klass and task.
    #
    def invoke(task_name)
      task = application.tasks.values.flatten.select { |task| task.task_name.equal?(task_name) }.first
      if task
        say("invoke: :#{task_name} [namespace: #{task.namespace}]")
        task.block.call
      end
    end

    private

      def print_all_tasks!
        application.tasks.keys.each_with_index do |namespace, index|
          say '' if index > 0
          say("Namespace: #{namespace}")
          say('-' * (11 + namespace.name.size))
          application.tasks[namespace].each do |task|
            say "task :#{task.task_name} # Without Description"
          end
        end
      end

  end
end