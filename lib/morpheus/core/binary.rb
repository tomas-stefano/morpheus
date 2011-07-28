module Morpheus
  class Binary
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
    end
  end
end