module Morpheus
  module Main
    # Module responsible to handle some shell commands
    #
    module ShellHelpers
      # Run a command in the shell
      #
      # ==== Examples
      #
      #   run 'ls'
      #   run 'pwd'
      #
      def run(command)
      end
      
      # Ask something to the user and return an response.
      #
      # ==== Examples
      #
      # ask("What is your name?")
      #
      def ask(question)
      end
      
      # Say something to the user.
      #
      # ==== Example
      #
      # say("Hi. I wanna sleep now. :\")
      #
      def say(message)
      end
      
      # Run a command in git.
      #
      # ==== Examples
      #
      #   git :init
      #   git :add => "some_file.rb"
      #   git :add => ".", :rm => "some_file.cxx"
      #
      def git(arguments)
      end
      
      # Run the ruby command
      #
      # ==== Examples
      #
      #   ruby 'file.rb'
      #   ruby '-Ilib file.rb'
      #
      def ruby(string)
      end
      
      # Run the python command
      #
      # ==== Examples
      #
      #   python 'python_file.py'
      #
      def python(string)
      end
      
      # Run the gcc command
      #
      # ==== Examples
      #
      #   gcc '-c hello_world.c -o hello_world'
      #
      def gcc(string)        
      end
      
      # Run the make command
      #
      # ==== Examples
      #
      #   make
      #   make :install
      #   make :clean
      #
      def make(string)
      end
    end
  end
end