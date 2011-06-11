Feature: Invoke normal tasks
  In order to run my tasks
  As a user
  I want invoke my tasks from a shell

  Scenario: Invoke a task by name
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
      task :example do
        say 'Task Example'
      end
    end
    """
    When I run `task example`
    Then the stdout should contain exactly:
    """
    invoke: :example [namespace: Tasks]
	Task Example

    """
  
