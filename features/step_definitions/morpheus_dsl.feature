Feature: Morpheus DSL
  In order to create tasks in a simple and elgant way
  As a user
  I want to customize the tasks the way I need

  Scenario: Main Namespace
    Given a file named "Tasks" with:
    """
	:alice.tasks do
	  task :example do
	    say('example')
	  end
	end
    """
    When I run `task example`
    Then the stdout should contain exactly:
    """
    [namespace: Alice]: invoke :example
    example

    """
  
  Scenario: Call a task by a namespace
    Given a file named "Tasks" with:
    """
    :db.tasks do
      task :migrate do
        say('Migrating Database')
      end
    end
    """
    When I run `task db:migrate`
    Then the stdout should contain exactly:
    """
    [namespace: Db]: invoke :migrate
    Migrating Database

    """
  

  
