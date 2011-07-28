module Morpheus
  class Task
    class << self
      # Everytime someone inherits from Morpheus::Task class, register the klass.
      #
      def inherited(klass)
        subclasses.push(klass)
      end

      # Returns the classes that inherits from Morpheus::Task
      #
      # ==== Returns
      # Array[Class]
      #
      def subclasses
        @subclasses ||= []
      end

      # Returns the method name that will be used in the scope of Morpheus::Base class
      #
      # ==== Returns
      # Symbol[Class]
      #
      def method_name(_method_name=nil)
        if _method_name
          @_method_name = _method_name
        else
          @_method_name ||= self.to_s.underscore.to_sym
        end
      end
    end
  end
end