require 'morpheus/version'
require 'active_support'

module Morpheus
  extend ActiveSupport::Autoload

  autoload :Adapters
  autoload :FullTextSearch
  autoload :Persistence
  autoload :QueryMethods
  autoload :Relation
end