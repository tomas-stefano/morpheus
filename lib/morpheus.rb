require 'active_support/core_ext'

module Morpheus
  autoload :Base, 'morpheus/core/base'
  autoload :Binary, 'morpheus/core/binary'
  autoload :Description, 'morpheus/core/description'  
  autoload :Generator, 'morpheus/core/generator'
  autoload :Task, 'morpheus/core/task'

  module Main
    autoload :Matchers, 'morpheus/main/matchers'    
    autoload :Requirable, 'morpheus/main/requirable'
    autoload :Runner, 'morpheus/main/runner'
  end
  
  module Internals
    autoload :ProvidedTask, 'morpheus/internals/provided_task'
  end

  include Main
  include Internals
end

require 'morpheus/contrib/all'