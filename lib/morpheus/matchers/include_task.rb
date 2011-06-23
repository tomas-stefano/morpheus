module Morpheus
  module Matchers
    # :call-seq:
    #   should include_task(expected)
    #   should_not include_task(expected)
    #
    # Passes if actual includes expected task name.
    # You can also pass in multiple args and
    # it will only pass if all args are found in collection.
    #
    # == Examples
    #
    #   [#<Task @name=:example>].should include_task(:example) # => would pass
    #   [#<Task @name=:example>, #<Task @name=:other>].should include_task(:example, :other) # => would pass
    #   [#<Task @name=:example>, #<Task @name=:other>].should include_task(:example, :other, :dont_exist) # => would fail
    #   [#<Task @name=:example>].should_not include_task(:other)
    #
    def include_task(*expected)
      Matcher.new :include_task, *expected do |*_expected|
        diffable
        match do |actual|
          _expected.all? do |expected|
            actual.collect { |task| task.name.to_sym }.include?(expected)
          end
        end
      end
    end

  end
end
