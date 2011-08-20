module Morpheus
  module Main
    # The Morpheus Binary to list tasks, helpers, run tasks, generators
    #
    class Runner < ::Morpheus::Binary
      # flag %w(--help -h) => :help, '-T' => :list
      
      def default
        # find_default_task
      end
      
      def list
        # when it calls task list call this methi
      end
      
      def help
      end
    end
  end
end