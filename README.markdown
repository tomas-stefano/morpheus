Morpheus
========

Morpheus, task framework, making it more flexible to extend all the important tasks used in the Ruby community, 
in a simple and elegant Domain Specific Language.

The Morpheus gem is responsible to keep your tasks in order and more important -> <b>Simple</b> and <b>Clean</b>.

The Feature
===========

<div style="padding:2px; border:1px solid silver; float:right; margin:0 0 1em 2em; background:white">
  <img src="https://github.com/tomas-stefano/morpheus/raw/master/images/free_your_mind.jpg" alt="Morpheus" />
</div>

**Morpheus says: You have to let it all go. Fear, doubt, and disbelief. Free your mind.**

I'm a lazy programmer. And so is the feature:

    As a lazy programmer
    I want to write minimal code of tasks (Elegant code)
    In order to have the tasks running the way I need
    And / or able to customize the tasks that I want in a more simple and elegant way

The purposes of the project are:

- Remove duplication of tasks.
- Have a Domain Specific Language to 'shape' tasks.
- Refactor all the tasks.
- Make the code of creating tasks, more cleaner.
- Making people to write the smallest possible number of code to create tasks that exist in the Ruby community.
- Create conventions of writing tasks (remember - Convention Over Configuration)

Install
=======

<div style="padding:2px; border:1px solid silver; float:right; margin:0 0 1em 2em; background:white">
  <img src="https://github.com/tomas-stefano/morpheus/raw/master/images/morpheus_red_blue_pill.jpg" alt="Morpheus" />
</div>

**Morpheus says: This is your last chance. After this, there is no turning back. You take the blue pill - the story ends, you wake up in your bed and believe whatever you want to believe. You take the red pill - you stay in Wonderland and I show you how deep the rabbit-hole goes.**

    gem install morpheus

Let's Fun!
==========

<div style="padding:2px; border:1px solid silver; float:right; margin:0 0 1em 2em; background:white">
  <img src="https://github.com/tomas-stefano/morpheus/raw/master/images/see_for_yourself.jpg" alt="Morpheus" />
</div>

**Morpheus says: Unfortunately, no one can be told what the matrix is. You have to see it for yourself.**

Imagine that do you wanna create a gem that had some tasks. Imagine that your gem name is <b>Alice</b>:

     :alice.tasks do # this is the same as: class AliceTasks < Morpheus::Base
        include_gem_tasks
        rspec :format => :documentation
        rdoc
        backup :source, :with => :gzip
        clobber :remove => %w(doc pkg tmp coverage)
     end

Then you wanna know all the tasks:

     $ task list

	  Namespace: AliceTasks
	  ------------------
	  task :rspec   # Run specs with format documentation
	  task :rdoc    # Generate documentation for the project
      task :backup  # Backup Source with Gzip
      task :clobber # Remove doc, pkg, tmp, coverage dirs and files

	      Include Namespace: GemTasks
	      -----------------------
          task :gemspec             # Generate and validate gemspec
          task :release             # Release gem
		  task :version:bump:major  # Bump the major version by 1
		  task :version:bump:minor  # Bump the a minor version by 1
		  task :version:bump:patch  # Bump the patch version by 1

There are many helper task methods in Morpheus gem.
To know all just run:

     $ task list helpers


