require 'rdoc/rdoc.rb'

module Morpheus
  # Class responsible to parse the description of all tasks
  #
  # ==== Examples
  #
  #  # This is a description of the task banner
  #  def banner
  #  end
  #
  # The Description instance will parse the task banner 
  #
  class Description < String
    attr_reader :results
    def initialize(task)
      @task = task
      @filename = @task.namespace.filename
      if File.exist?(@filename)
        @content  = File.open(@filename, "r") { |f| f.read }
        @results  = rdoc_parser.scan
      else
        @results = ""
      end
    end

    # Parse the task search through the comment for the given method in the given namespace
    # If the file don't exist, return an empty string
    #
    def parse!
      return self if results.is_a?(String)
      
      if results_class
        self.concat(find_method.try(:comment).to_s)
      end
      
      self
    end
    
    def rdoc_parser
      RDoc::Parser::Ruby.new(top_level, @filename, @content, options, stats)
    end
    
    def stats
      RDoc::Stats.new(@content)
    end
    
    def options
      RDoc::Options.new
    end
    
    def top_level
      RDoc::TopLevel.new(@filename)
    end
    
    private
      def results_class
        @results_class ||= results.classes.find { |klass| klass.name == "#{@task.namespace}" }
      end
      
      def find_method
        results_class.method_list.find { |method_name| method_name.name == @task.name.to_s }
      end
  end
end