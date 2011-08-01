module Morpheus
  module Main
    # The Morpheus Binary to list tasks, helpers, run tasks, generators
    #
    class Runner < ::Morpheus::Binary
      # flag %w(--help -h) => :help, '-T' => :list
      
      def default
      end
      
      def list
      end
      
      def help
      end
    end
  end
end