module Morpheus
  class Application
    include Shell
    attr_accessor :namespaces

    def initialize
      @namespaces = []
    end

    class << self

      # Run! from command line and cached the application instance
      #
      def run!
        Morpheus.application.run!
      end
    end

    def run!
      load_task_file
      argument = ARGV.shift.to_sym
      begin
        send(argument)
      rescue
        invoke(argument)
      end
    end

    # TODO: Searching in tasks folder too
    #
    def load_task_file
      load(File.expand_path('Tasks', Dir.pwd))
    end

    # List the available Morpheus Tasks
    #
    def list
      if dont_have_tasks?
        say("No Morpheus tasks available")
        exit(1)
      else
        namespaces.each_with_index do |namespace, index|
          say('') if index > 0
          say("Namespace: #{namespace.klass}")
          say('-' * (11 + namespace.klass.to_s.size))
          namespace.tasks.each do |task|
            say("task :#{task.task_name} # Without Description")
          end
        end
      end
    end

    # Invoke the given namespace or class given. It adds an instance
    # method that will invoke the klass and task.
    #
    def invoke(task_name)
      find_task(task_name)
    end

    def add_namespace(namespace)
      namespaces.push(namespace)
    end

    def add_task(task, options)
      namespace = get_namespace(options[:to_namespace])
      namespace.tasks.push(task)
    end

    def get_namespace(namespace)
      namespaces.find { |name| name.klass == namespace }
    end

    def find_task(task_name)

    end

    def dont_have_tasks?
      namespaces.collect { |namespace| namespace.tasks }.flatten.empty?
    end
  end
end