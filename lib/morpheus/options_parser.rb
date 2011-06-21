module Morpheus
  class OptionsParser
    attr_accessor :options, :booleans, :strings

    def initialize(options)
      @options = options
      @booleans = select_type(:boolean)
      @strings  = select_type(:string)
    end

    def parse(*args)
      available_types.each do |type|
        send("parse_#{type}")
      end
    end

    def available_types
      %w(string boolean)
    end

    def parse_string

    end

    def parse_boolean

    end

    private
      def select_type(type)
        @options.select { |key, value| value.equal?(type) }
      end
  end
end