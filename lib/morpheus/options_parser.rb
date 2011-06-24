module Morpheus
  class OptionsParser < Hash
    attr_accessor :options, :booleans, :strings

    def initialize(options)
      @options = options
      @booleans = select_type(:boolean)
      @strings  = select_type(:string)
      @flags = {}
    end

    def parse(*args)
      args.flatten.each do |element|
        match = long_regexp?.match(element)
        if match
           @flags = match[1]
        end
      end
      { 'dont' => 'drink', 'skip' => true}
      #
      # args = ["--dont=drink", "--wonderland"]
      #
      # when EQ_RE, SHORT_NUM        -> EQ_RE = /^(--\w+(?:-\w+)*|-[a-z])=(.*)$/i
                                   # -> SHORT_NUM = /^(-[a-z])#{NUMERIC}$/i
      #   unshift($2)
      #   switch = $1
      #
    end

    def long_regexp?
      /^(--\w+(?:-\w+)*)$/
    end

    # Parse -l for single char
    #
    def short_regexp?
      /^(-[a-z])$/i
    end

    def short_numeric?
      /^(-[a-z])(\d*\.\d+|\d+)$/i
    end

    # Parse -l -a or -la for single char
    #
    def single_chars?
      /^-([a-z]{2,})$/i
    end

    def eq_regexp?
      /^(--\w+(?:-\w+)*|-[a-z])=(.*)$/i
    end

    private
      def select_type(type)
        @options.select { |key, value| value.equal?(type) }
      end
  end
end