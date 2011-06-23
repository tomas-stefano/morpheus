module Morpheus
  module Matchers
    # :call-seq:
    #   should have_task(expected)
    #   should_not have_task(expected)
    #
    # Passes if actual haves expected task name.
    # You can also pass in multiple args and
    # it will only pass if all args are found in collection.
    #
    # == Examples
    #
    #   [#<Task @name=:example>].should have_task(:example) # => would pass
    #   [#<Task @name=:example>, #<Task @name=:other>].should have_task(:example, :other) # => would pass
    #   [#<Task @name=:example>, #<Task @name=:other>].should have_task(:example, :other, :dont_exist) # => would fail
    #   [#<Task @name=:example>].should_not have_task(:other)
    #
    def have_task(expected, task_class=Morpheus::Task)
      Matcher.new :have_task, expected do |_expected|

        match do |actual|
          actual.all? do |task|
            task.should be_instance_of(task_class)
            task.name == _expected
          end
        end

        failure_message_for_should do |actual|
          "expected #{actual} to have ONLY task :#{expected}"
        end

      end
    end

  end
end
