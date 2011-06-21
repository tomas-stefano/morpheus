require 'bundler'
require 'morpheus'
require 'rspec'

# Load fixtures
#
load File.join(File.dirname(__FILE__), 'fixtures', 'task_example.tasks')

RSpec.configure do |config|

  def create_options(options)
    @options = Morpheus::OptionsParser.new(options)
  end

  def parse_options(*arguments)
    @options.parse(arguments.flatten)
  end
end