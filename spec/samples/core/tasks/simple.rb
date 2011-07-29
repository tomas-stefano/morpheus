class SimpleTasks < Morpheus::Base
  rubygems :name => :simple
  test_unit :ruby_versions => %w(jruby 1.9.2)
  rdoc :doc
  # default :test
end