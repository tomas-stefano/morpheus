require "samples/core/task_methods/example_task_method"

class SimpleTasks < Morpheus::Base
  rubygems :name => :simple
  test_unit :ruby_versions => %w(jruby 1.9.2)
  rdoc :doc
  example :provided_example_task, :format => :doc, :ls => true
  without_run_method
  # default :test
end