Symbol.class_eval do
  def tasks(&block)
    Morpheus::Namespace.new(self, &block).namespace.class_eval(&block)
  end
end