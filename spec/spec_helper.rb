require 'morpheus'
require 'rspec'

Morpheus::Task.register_methods
Dir["spec/samples/*/*/*"].each { |file| load(file) }

RSpec.configure do |config|
  config.include Morpheus::Matchers
end