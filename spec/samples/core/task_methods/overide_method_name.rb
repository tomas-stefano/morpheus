class RubygemExample < Morpheus::Task
  def self.method_name
    :rubygems
  end

  def call
    'Running rubygems method'
  end
end