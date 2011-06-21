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
    # REFACTOR ME: I know thos code sucks but this is a little spike
    #
    def invoke(task_name)
      if task_name.to_s.include?(':')
        namespace, task_name = task_name.to_s.capitalize.split(':')
        results = application.tasks[Object.const_get(namespace)].select { |task| task.task_name.equal?(task_name.to_sym) }
      else
        results = application.tasks.values.flatten.select { |task| task.task_name.equal?(task_name) }
      end
      say("The task :#{task_name} appears in #{results.size} namespaces(#{results.collect(&:namespace).join(', ')})") if results.size > 1
      results.each do |task|
        say("[namespace: #{task.namespace}]: invoke :#{task_name}")

        # If a task has a block call the block
        # else
        #   just a invoke a method
        # end
        if task.block
          task.namespace.new.instance_eval(&task.block)
        else
          task.namespace.new.send(task.task_name)
        end
      end
      say("Could not find the task :#{task_name} in any namespace available.") if results.empty?
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