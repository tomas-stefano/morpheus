require 'morpheus/dsl'
require 'singleton'

module Morpheus
  autoload 'Application', 'morpheus/application'
  autoload 'Base', 'morpheus/base'
  autoload 'FindTask', 'morpheus/find_task'
  autoload 'Matchers', 'morpheus/matchers'
  autoload 'Namespace', 'morpheus/namespace'
  autoload 'OptionsParser', 'morpheus/options_parser'
  autoload 'Shell', 'morpheus/shell'
  autoload 'Task', 'morpheus/task'

  def self.application
    @application ||= Application.new
  end
end
