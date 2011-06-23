require 'bundler'
require 'morpheus'
require 'rspec'

Dir['spec/matchers/*'].each { |file| require File.expand_path(file) }

# Load fixtures
#
fixtures_folder = File.join(File.dirname(__FILE__), 'fixtures')
Dir["#{fixtures_folder}/*.tasks"].each { |file| load file }

RSpec.configure do |config|

  def create_options(options)
    @options = Morpheus::OptionsParser.new(options)
  end

  def parse_options(*arguments)
    @options.parse(arguments.flatten)
  end

  def new_task(task_name)
    Morpheus::Task.new(task_name, :namespace => DefaultTasks)
  end

  def default_namespace
    DefaultTasks
  end
end