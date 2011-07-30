class ExampleTask < Morpheus::Task
  def run
    options
  end
end

Morpheus::Task.register_methods