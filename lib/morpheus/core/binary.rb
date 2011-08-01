module Morpheus
  class Binary
    # Attribute to kepp the ARGV cloned
    attr_accessor :argv
    class << self
      # Everytime someone inherits from Morpheus::Binary class, register the klass into baseclass.
      #
      def inherited(klass)
        subclasses.push(klass)
      end

      # Returns the classes that inherits from Morpheus::Base
      #
      # ==== Returns
      # Array[Class]
      #
      def subclasses
        @subclasses ||= []
      end
      
      # Options to parse and create and #options instance method that is a parsed result from this 
      # options.
      # 
      # ==== Parameters
      #   user_options<Hash>: the values may only be: :string, :hash, :boolean, :numeric
      #
      # ==== Examples
      #
      # class GitExample < Morpheus::Binary
      #   options :squash => :string, :author => :string
      # end
      #
      def options(user_options={})
        @options = user_options unless user_options.empty?
        @options
      end
      
      # Setup the default task to run when not pass any ARGV in the command line
      #
      # ==== Examples
      #
      #   class GitBinary < Morpheus::Binary
      #     default :clone
      #
      #     def clone
      #     end
      #   end
      #
      def default(default_task=nil)
        @default_task = default_task if default_task
        @default_task
      end    
    end
    
    def initialize(*argv)
      @argv = argv.clone
    end
    
    # Method resposible to handle the options/arguments parser and run! the binary
    #
    def run!
      if @argv.empty?
        default_task = self.class.default
        return self.send(default_task) if default_task
        self.default
      end
    end
    
    # SIGNATURE: This method exist if the user wants just override a method for the superclass
    #
    def default
    end
  end
end