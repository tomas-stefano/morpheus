Feature: Morpheus Options Parser
  In order to run my tasks with some options
  As a user
  I want to pass the options via command line

  # Scenario: Pass a String in the Options Parser
  #   Given a file named "Tasks" with:
  #   """
  #   :alice.tasks do
  #     options :dont => :string
  # 
  #     task :forbidden do
  #       say(options)
  #     end
  #   end
  #   """
  #   When I run `task forbidden --dont drink`
  #   Then the stdout should contain exactly:
  #   """
  #   [namespace: Alice]: invoke :forbidden
  #   {:dont=>:drink}
  # 
  #   """
  # 
