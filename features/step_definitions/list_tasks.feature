Feature: List tasks
  In order to know the available tasks to choose one to run
  As a user
  I want to Morpheus list all tasks available

  Scenario: Empty Tasks
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
    end
    """
    When I run `task list`
    Then the stdout should contain exactly:
    """
    No Morpheus tasks available

    """

  Scenario: Should list a task with namespace
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
      task :task_example do
        'task_example'
      end
    end
    """
    When I run `task list`
    Then the stdout should contain exactly:
    """
    Namespace: Tasks
    ----------------
    task :task_example # Without Description

    """
  
  Scenario: Should list more than one namespace
    Given a file named "Tasks" with:
    """
    class Tasks < Morpheus::Base
      task :task_example do
        'task_example'
      end
    end

    class OtherTasks < Morpheus::Base
      task :other_task_example do
        :other_task_example
      end
    end
    """
    When I run `task list`
    Then the stdout should contain exactly:
    """
    Namespace: Tasks
    ----------------
    task :task_example # Without Description

    Namespace: OtherTasks
    ---------------------
    task :other_task_example # Without Description

    """

