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
      @content  = File.open(@filename, "r") { |f| f.read }        
      @results  = rdoc_parser.scan
    end
    
    def parse!
      self << results.classes.find { |klass| klass.name == "#{@task.namespace}" }.method_list.find { |method_name| method_name.name == @task.name.to_s }.comment
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
  end
end