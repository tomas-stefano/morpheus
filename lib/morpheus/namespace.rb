module Morpheus
  class Namespace
    attr_accessor :klass, :symbol_namespace, :block, :tasks

    # If the user is using normal ruby like
    #
    #  class MyNamespaceTasks < Morpheus::Base
    #  end
    #
    #  then you register only the class name and set they dont use the dsl
    #
    # if the user uses the dsl like:
    #
    # :my_namespace.tasks do
    # end
    #
    def initialize(*args, &proc)
      args = args.shift
      if args.is_a?(Hash)
        using_normal!(args)
      else
        using_dsl!(args)
      end
      @block = proc
      @tasks = []
      Morpheus.application.add_namespace(self)
    end

    def using_normal!(args)
      @klass = args[:class_name]
    end

    def using_dsl!(args)
      @symbol_namespace = args
      @klass = create_class!
    end

    def using_dsl?
      return false unless @symbol_namespace
      true
    end

    def create_class!
      Object.const_set(klass_name, Class.new(base_class))
    end

    def klass_name
      if @symbol_namespace.to_s.include?('tasks')
        camelize("#{@symbol_namespace}")
      else
        camelize("#{@symbol_namespace}_tasks")
      end
    end

    def base_class
      Morpheus::Base
    end

    def camelize(symbol)
      symbol.to_s.gsub(/(?:^|_)(.)/) { $1.upcase }
    end

  end
end