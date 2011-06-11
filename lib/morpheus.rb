module Morpheus
  autoload 'Application', 'morpheus/application'
  autoload 'Base', 'morpheus/base'
  autoload 'Runner', 'morpheus/runner'
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

# FIXME: Fix this ugly monkey patch
#
class Symbol
  def tasks

  end
end