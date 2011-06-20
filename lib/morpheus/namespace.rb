module Morpheus
  class Namespace
    attr_accessor :namespace, :symbol_namespace, :block

    def initialize(symbol, base_class = Morpheus::Base, &proc)
      @symbol_namespace = symbol
      @block = proc
      @namespace = create_class!(base_class)
    end

    def create_class!(base_class)
      Object.const_set(camelize(@symbol_namespace), Class.new(base_class))
    end

    def camelize(symbol)
      symbol.to_s.gsub(/(?:^|_)(.)/) { $1.upcase }
    end
  end
end