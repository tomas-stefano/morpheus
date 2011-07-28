require 'morpheus'
require 'rspec'

Dir["spec/samples/*/*/*"].each { |file| load(file) }