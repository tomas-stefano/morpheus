require 'bundler'
require 'morpheus'
require 'rspec'

# Load fixtures
#
fixtures_folder = File.join(File.dirname(__FILE__), 'fixtures')
Dir["#{fixtures_folder}/*.tasks"].each { |file| load file }

RSpec.configure do |config|
  include Morpheus::Matchers

  # config.use_morpheus_matchers!

  def create_options(options)
    @options = Morpheus::OptionsParser.new(options)
  end

  def parse_options(*arguments)
    @options.parse(arguments.flatten)
  end

  def new_task(task_name, namespace=default_namespace)
    Morpheus::Task.new(task_name, :namespace => namespace)
  end

  def application
    Morpheus.application
  end

  def default_namespace
    DefaultTasks
  end

  def fail_with(message)
    raise_error(RSpec::Expectations::ExpectationNotMetError, message)
  end

  def fail_spec
    raise_error(RSpec::Expectations::ExpectationNotMetError)
  end

end