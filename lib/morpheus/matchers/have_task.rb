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

        chain :from_namespace do |namespace|
          @namespace = namespace
        end

        match do |actual|
          actual.should_not be_empty
          actual.all? do |task|
            task.should be_instance_of(task_class)
            expression = if @namespace
              task.namespace == @namespace
            else
              true
            end
            task.name == _expected && expression
          end
        end

        failure_message_for_should do |actual|
          "expected #{actual} to have ONLY task :#{expected}"
        end

      end
    end

  end
end
