module Morpheus
  module FullTextSearch
    extend ActiveSupport::Concern

    included do
      include Core
      include Persistence
      include Querying
      include Relation
    end
  end
end