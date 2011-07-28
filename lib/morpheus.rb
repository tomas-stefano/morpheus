require 'active_support/core_ext'

module Morpheus
  autoload :Base, 'morpheus/core/base'
  autoload :Binary, 'morpheus/core/binary'
  autoload :Generator, 'morpheus/core/generator'
  autoload :Task, 'morpheus/core/task'

  module Main
    autoload :Requirable, 'morpheus/main/requirable'
    autoload :Runner, 'morpheus/main/runner'
  end

  include Main
end

require 'morpheus/contrib/base'