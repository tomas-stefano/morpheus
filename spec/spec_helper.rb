require 'morpheus'
require 'rspec'

Dir["spec/samples/*/*/*"].each { |file| load(file) }

RSpec.configure do |config|
  config.include Morpheus::Matchers
end