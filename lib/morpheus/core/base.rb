module Morpheus
  class Base
    class << self
      # Everytime someone inherits from Morpheus::Base class, register the klass into baseclass.
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
      
      # Create a method in the Morpheus::Base scope and when it call a method creating a Morpheus::Task
      #
      # ==== Returns
      # TrueClass[Class]
      #      
      def create_method(method_name)
        Base.instance_eval <<-RUBY, __FILE__, __LINE__
          def #{method_name}(*args)
            # Task.new(#{method_name}, args)
          end
        RUBY
        true
      end
    end
  end
end