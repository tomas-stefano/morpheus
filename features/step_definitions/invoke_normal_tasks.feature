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
    [namespace: Tasks]: invoke :example
	Task Example
	
    """
  
  Scenario: Invoke a task that dont exist
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
    end
    """
    When I run `task example`
    Then the stdout should contain exactly:
    """
	Could not find the task 'example' in any namespace available.

    """

  Scenario: Invoke the first task that exists in two namespaces and warn user
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
      task :exist_in_two_namespaces do
        say('from Tasks')
      end
    end

    class OtherTasks < Morpheus::Base
	  task :exist_in_two_namespaces do
		say('from Other Tasks')
	  end
    end
    """
    When I run `task exist_in_two_namespaces`
    Then the stdout should contain exactly:
    """
    The task :exist_in_two_namespaces appears in 2 namespaces(Tasks, OtherTasks)
    [namespace: Tasks]: invoke :exist_in_two_namespaces
    from Tasks

    """
  
  Scenario: Invoking by namespace
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
      task :deploy do
        say('Deploy')
      end
    end
    class OtherTask < Morpheus::Base
      task :deploy do
        say('Deploy from OtherTask')
      end
    end
    """
    When I run `task tasks:deploy`
    Then the stdout should contain exactly:
    """
    [namespace: Tasks]: invoke :deploy
    Deploy

    """
    And the stdout should not contain:
    """
    [namespace: OtherTask]: invoke :deploy
    """
  

  Scenario: Invoke task by a method
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
      def just_list_all
        say('Just listing')
      end
    end
    """
    When I run `task just_list_all`
    Then the stdout should contain exactly:
    """
	[namespace: Tasks]: invoke :just_list_all
	Just listing

    """
  
  Scenario: Invoke task without a block and do nothing
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
      task :just_list_all
    end
    """
    When I run `task just_list_all`
    Then the stdout should contain exactly:
    """
	[namespace: Tasks]: invoke :just_list_all
	(skipped) => task without a block

    """  