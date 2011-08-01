require 'morpheus'
require 'rspec'

Morpheus::Task.register_methods
Dir["spec/samples/*/*/*.rb"].each { |file| load(file) }

RSpec.configure do |config|
  config.include Morpheus::Matchers, Morpheus::ShellHelpers
  config.mock_with :rr
end