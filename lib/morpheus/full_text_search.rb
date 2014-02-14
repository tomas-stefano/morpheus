module Morpheus
  module FullTextSearch
    extend ActiveSupport::Concern

    included do
      include Core
      include Persistence
      include QueryMethods
      include Relation
    end
  end
end