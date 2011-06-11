module Morpheus
  module Shell
    def self.included(base)
      base.extend(Methods)
      base.send(:include, Methods)
    end

    module Methods
      def say(text)
        puts text
      end
    end
  end
end