module Morpheus
  class Generator
    class << self
      # Everytime someone inherits from Morpheus::Generator class, register the klass into baseclass.
      #
      def inherited(klass)
        subclasses.push(klass)
      end

      # Returns the classes that inherits from Morpheus::Generator
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