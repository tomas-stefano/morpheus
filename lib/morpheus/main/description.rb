require 'rdoc/rdoc.rb'

module Morpheus
  module Main
    class Description < String
      attr_reader :results
      
      # REFACTOR ME: Refactor and comment this code
      #
      def initialize(task)
        @task = task
        @filename  = @task.namespace.filename
        @content   = File.open(@filename, "r") { |f| f.read }
        @results   = RDoc::Parser::Ruby.new(RDoc::TopLevel.new(@filename), @filename, @content, RDoc::Options.new, RDoc::Stats.new(@content)).scan
        parse_description!
      end
      
      def parse_description!
        self << results.classes.find { |klass| klass.name == "#{@task.namespace}" }.method_list.find { |method_name| method_name.name == @task.name.to_s }.comment
      end
    end
  end
end