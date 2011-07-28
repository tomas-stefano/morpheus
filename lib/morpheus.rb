require 'rdoc'
require 'active_support/core_ext'

module Morpheus
  # Core #
  autoload :Base, 'morpheus/core/base'
  autoload :Binary, 'morpheus/core/binary'
  autoload :Generator, 'morpheus/core/generator'
  autoload :Requirable, 'morpheus/core/requirable'
  autoload :Task, 'morpheus/core/task'

  # Main #
  autoload :Helpers, 'morpheus/helpers'
  autoload :Runner, 'morpheus/runner'
end