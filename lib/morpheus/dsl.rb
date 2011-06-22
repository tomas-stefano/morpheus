Symbol.class_eval do
  def tasks(&block)
    Morpheus::Namespace.new(self, &block).klass.class_eval(&block)
  end
end