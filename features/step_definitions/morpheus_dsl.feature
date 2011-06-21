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
    [namespace: AliceTasks]: invoke :example
    example

    """
  
  # Scenario: Call a task by a namespace
  #   Given a file named "Tasks" with:
  #   """
  #   :db.tasks do
  #     task :migrate do
  #       say('Migrating Database')
  #     end
  #   end
  #   """
  #   When I run `task db:migrate`
  #   Then the stdout should contain exactly:
  #   """
  #   [namespace: DbTasks]: invoke :migrate
  #   Migrating Database
  # 
  #   """
  
  # Scenario: Nested Namespaces
  #   Given a file named "Tasks" with:
  #   """
  #   :time.tasks do
  #     :zones.tasks do
  #        task :all do
  #          say('Listing timezones')
  #        end
  # 	  end
  #   end
  #   """
  #   When I run `task time:zones:all`
  #   Then the stdout should contain exactly:
  #   """
  #   [namespace: TimeTasks::ZonesTasks]: invoke :all
  #   Listing timezones
  #   """
  
