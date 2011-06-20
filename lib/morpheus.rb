require 'morpheus/dsl'

module Morpheus
  autoload 'Application', 'morpheus/application'
  autoload 'Base', 'morpheus/base'
  autoload 'Namespace', 'morpheus/namespace'
  autoload 'Runner', 'morpheus/runner'
  autoload 'Shell', 'morpheus/shell'
  autoload 'Task', 'morpheus/task'

  def self.run!
    runner.run!
  end

  def self.runner
    @runner ||= Runner.new(ARGV)
  end

  def self.application
    @application ||= Application.new
  end
end
