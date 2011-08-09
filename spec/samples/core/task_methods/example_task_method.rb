class ExampleTask < Morpheus::Task
  def call
    options
  end
end

Morpheus::Task.register_methods