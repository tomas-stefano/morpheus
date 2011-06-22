Feature: Morpheus Options Parser
  In order to run my tasks with some options
  As a user
  I want to pass the options via command line

  Scenario: Pass a String in the Options Parser
	Given a file named "Tasks" with:
    """
    :alice.tasks do
      options :dont => :string
  
      task :forbidden do
        say(options)
      end
    end
    """
    When I run `task forbidden --dont drink`
    Then the stdout should contain exactly:
    """
    [namespace: AliceTasks]: invoke :forbidden
    {"dont"=>"drink"}

    """

  Scenario: Pass a string in options parser using a normal ruby method
    Given a file named "Tasks" with:
    """
	class AliceTasks < Morpheus::Base
	  options :dont => :string
	
	  def forbidden
	    say(options)
	  end
	end
    """
    When I run `task forbidden --dont drink`
    Then the stdout should contain exactly:
	"""
	[namespace: AliceTasks]: invoke :forbidden
	{"dont"=>"drink"}

    """  
  
  Scenario: Pass a boolean and return false when is not passed in the Options Parser
	Given a file named "Tasks" with:
    """
    :alice.tasks do
      options :list => :string, :okay => :boolean

      task :forbidden do
        say(options)
      end
    end
    """
    When I run `task forbidden --list helpers`
    Then the stdout should contain exactly:
    """
    [namespace: AliceTasks]: invoke :forbidden
    {"list"=>"helpers"}

    """

  Scenario: Dont run when not pass required options
	Given a file named "Tasks" with:
    """
    :alice.tasks do
      options :list => {type: :string, required: true}, :okay => :boolean

      task :forbidden do
        say(options)
      end
    end
    """
    When I run `task forbidden`
    Then the stdout should contain exactly:
    """
    [namespace: Alice]: invoke :forbidden
    '--list' is a required option.

    """
