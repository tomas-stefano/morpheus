module Morpheus
  module Main
    # Will require given the name the passed in initialize
    #
    # If you want all files to require just pass :all
    # The convention is to search the tasks folder in Dir.pwd
    #
    # ==== Examples
    #
    # Require all tasks in the #{Dir.pwd}/tasks:
    #
    #    Morpheus::Requirable.new(:all).require! # => true
    #
    # Override the directory folder.
    #
    #    Morpheus::Requirable.new(:all, :directory => 'app_tasks').require!
    #
    # Pass a normal ruby file to require in the tasks folder:
    #
    #    Morpheus::Requirable.new(:app).require!
    #
    # Pass a normal ruby file to require in a custom folder:
    #
    #    Morpheus::Requirable.new(:app, :directory => 'custom').require!
    #
    class Requirable
      attr_accessor :name, :directory
      def initialize(*args)
        options = args.extract_options!
        @directory = options.delete(:directory) || File.join(Dir.pwd, 'tasks')
        @name = args.shift
      end
      
      # Method responsible to require Morpheus tasks
      #
      def require!
        if @name.equal?(:all)
          Dir[File.join(@directory, "*.rb")].each { |file| load(file) }
          return true
        end
        
        load(File.join(directory, "#{@name.to_s}.rb"))
      end
    end
  end
end