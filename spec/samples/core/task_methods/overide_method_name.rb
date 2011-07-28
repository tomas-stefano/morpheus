class RubygemExample < Morpheus::Task
  def self.method_name
    :rubygems
  end

  def run
    'Running rubygems method'
  end
end