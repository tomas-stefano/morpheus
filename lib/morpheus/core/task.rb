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
          @_method_name ||= self.to_s.underscore.gsub("_task", "").to_sym
        end
      end

      # Register all methods from Morpheus::Task subclasses and add in the Morpheus::Base scope
      # If is a better way to do it, refactor this code.
      #
      # ==== Returns
      # Array[Class]
      #
      def register_methods
        subclasses.each { |subclass| Base.create_method(subclass.method_name) }
      end
    end
  end
end