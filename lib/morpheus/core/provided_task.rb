module Morpheus
  # Class Responsible to create the method that is provided by the Morpheus::Task subclasses
  #
  class ProvidedTask
    attr_reader :subclass, :method_name
    def initialize(subclass)
      @subclass = subclass
      @method_name = subclass.method_name
    end
    
    # Create the method in the baseclass
    #
    # ==== Returns
    # ProvidedTask[Class]
    #
    def create_method
      baseclass.instance_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{@method_name}(*args)
          options = args.extract_options!
          args.unshift(:"#{@method_name.to_sym}") if args.empty?
          options = {:description => '', :provided_by => #{@subclass}, :namespace => self }.merge(options)
          self.tasks.push(Task.new(*args, options))
        end
      RUBY
      self
    end
    
    def baseclass # :nodoc:
      Morpheus::Base
    end
  end
end