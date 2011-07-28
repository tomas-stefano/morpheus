module Morpheus
  module Helpers
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
    end
  end
end