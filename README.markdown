Morpheus
========

Morpheus, task framework, making it more flexible to extend all the important tasks used in the Ruby community, 
in a simple and elegant Domain Specific Language.

The Morpheus gem is responsible to keep your tasks in order and more important -> <b>Simple</b> and <b>Clean</b>.

The Feature
-----------

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
-------

<div style="padding:2px; border:1px solid silver; float:right; margin:0 0 1em 2em; background:white">
  <img src="https://github.com/tomas-stefano/morpheus/raw/master/images/morpheus_red_blue_pill.jpg" alt="Morpheus" />
</div>

**Morpheus says: This is your last chance. After this, there is no turning back. You take the blue pill - the story ends, you wake up in your bed and believe whatever you want to believe. You take the red pill - you stay in Wonderland and I show you how deep the rabbit-hole goes.**

    gem install morpheus

Let's Fun!
----------

<div style="padding:2px; border:1px solid silver; float:right; margin:0 0 1em 2em; background:white">
  <img src="https://github.com/tomas-stefano/morpheus/raw/master/images/see_for_yourself.jpg" alt="Morpheus" />
</div>

**Morpheus says: Unfortunately, no one can be told what the gem is. You have to see it for yourself.**

Imagine that do you wanna create a gem that had some tasks. Imagine that your gem name is <b>Alice</b>:

     :alice.tasks do # this is the same as: class AliceTasks < Morpheus::Base
        include_gem_tasks
        rspec :format => :documentation
        rdoc
        backup :source, :with => :gzip
        clobber :remove => %w(doc pkg tmp coverage)
		stats
     end

Then you wanna know all the tasks:

     $ task list

	  Namespace: AliceTasks
	  ------------------
	  task :rspec   # Run specs with format documentation
	  task :rdoc    # Generate documentation for the project
      task :backup  # Backup Source with Gzip
      task :clobber # Remove doc, pkg, tmp, coverage dirs and files
	  task :stats   # Print statistics of project

	      Include Namespace: GemTasks
	      -----------------------
          task :gemspec             # Generate and validate gemspec
          task :release             # Release gem
		  task :version:bump:major  # Bump the major version by 1
		  task :version:bump:minor  # Bump the a minor version by 1
		  task :version:bump:patch  # Bump the patch version by 1


Now imagine that you want create your own task:

     :alice.tasks do # this is the same as: class AliceTasks < Morpheus::Base
        include_gem_tasks
        rspec :format => :documentation
        rdoc
        backup :source, :with => :gzip
        clobber :remove => %w(doc pkg tmp coverage)
	 	stats
         
        task :this_is_a_task! do
          'This is a task'
        end

		def this_is_a_task_too!
		  "#{this_is_a_task} too!" # This is how invoke a task! Just call a method!
		end
     end

<div style="padding:2px; border:1px solid silver; float:right; margin:0 0 1em 2em; background:white">
  <img src="https://github.com/tomas-stefano/morpheus/raw/master/images/morph_neo.jpg" alt="Morpheus"  width:'350px' />
</div>

**Morpheus says: I imagine that right now, you're feeling a bit like Alice. Hmm? Tumbling down the rabbit hole?**


Imagine now that you want to pass some options in the command line like that

    $ task wonderland --dont drink

     :alice.tasks do
       options :dont => :string
       task :wonderland do
         options # => { 'dont' => 'drink' }
         say(options)
       end
      end

Imagine now that you want to create a simple generator:

     :alice.generator do # This is the same as class AliceGenerator < Morpheus::Generator
       def create_app_dir
         empty_directory 'app'
       end
     end

Run with:

     $ task g alice

Create a Robust Binary:

     :my_binary.binaries do # This is the same as class MyBinary < Morpheus::Binary
        options :format => :string, :color => :boolean
     end

     >> my_binary = MyBinary.new(['--format', 'documentation', '--color'])
     >> my_binary.options
     { :format => :documentation, :color => true }

There are other task gems that trying to do this, why you create this gem?
--------------------------------------------------------------------------

* The answer: Why not?

<div style="padding:2px; border:1px solid silver; float:right; margin:0 0 1em 2em; background:white">
  <img src="https://github.com/tomas-stefano/morpheus/raw/master/images/there_are_no_spoon.png" alt="Morpheus" />
</div>

**Morpheus says: Do not try and bend the spoon. That's impossible. Instead... only try to realize the truth ... There is no spoon.**

There are many helpers methods in Morpheus gem.
To know all just run:

     $ task list helpers

        Main Helpers
        -------------
          * require_files
          * require_tasks

        Base Helpers
        ------------
		  * arguments
          * backup
          * clobber
		  * console
          * include_gem_tasks
		  * options
          * rdoc
          * rspec
          * stats
          * test_unit

        Generator Helpers
        -----------------
          * create_dir or mkdir_p
          * create_file

        Shell Helpers
        -------------
          * run_without_aborting
          * git
          * say
          * run
          * ruby

		System Helpers
		--------------
          * yarv?
          * jruby?
          * macruby?
          * ree?
          * rubinius?
          * windows?
          * bsd?
          * linux?
          * mac?

To know more about one specific helper method, just run:

      $ task man require_files

