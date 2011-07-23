GOALS
=====

I'm a lazy programmer. And so is the feature:

    As a lazy programmer
    I want to write minimal code of tasks (Elegant code)
    In order to have the tasks running the way I need
    And / or able to customize the tasks that I want in a more simple and elegant way

<b> Morpheus says: You have to let it all go. Fear, doubt, and disbelief. Free your mind. </b>

The purposes of the project are:

- Remove duplication of tasks.
- Have a Domain Specific Language to 'shape' tasks.
- Refactor all the tasks.
- Make the code of creating tasks, more cleaner.
- Making people to write the smallest possible number of code to create tasks that exist in the Ruby community.
- Create conventions of writing tasks (remember - Convention Over Configuration)
- Create a very easy way to test task very easily

TODO
====

Create default tasks that run with the #task and #morpheus binary(list, help)

Will list all the tasks in each namespace.

     $ task list

* Possible to run/invoke tasks in the command line:

#### Creating Tasks

   1º Alternative:

         class Tasks < Morpheus::Base
           def this_is_a_task
             # ...
           end
         end

   2º Alternative:

        :lib.tasks do
           :abc.task do
              # ...
           end
        end

#### Nested Namespaces

    :time.tasks do
       :zones.tasks do
         :list.task do
           # list timezones
         end
       end
    end

Run with

    $ task time:zones:list

#### Provide tasks

In case you need an existent task called rspec for example:

     class Tasks < Morpheus::Base
       rspec :color => true, :format => :doc
     end

     class RSpecTask < Morpheus::Task
       def call
         # puts hash_options # hash_options will be a method and in this case will return # => { :color => true, :format => :doc}
       end
     end

It's possible to use a block to:

     class Tasks < Morpheus::Base
       ruby_extension do
         name :core
         ext_dir 'ext/core'
         lib_dir 'my_lib/core'
	   end
     end

     class RubyExtensionTask < Morpheus::Task
       def call
         # will be a method called #action that will return a proc object
       end
     end

### Require tasks

Create a way to require other file with the *.tasks

    require_tasks 'abc' # the same as: load 'abc.tasks'

    require_tasks(:all).in_dir('tasks') # will require all .tasks in the tasks dir

### Helpers

Create a useful way in the command line to user know more about Morpheus provided tasks:

      $ task help rspec # and this will look for a file called rspec_task.ronn

See ronn gem for details [https://github.com/rtomayko/ronn](https://github.com/rtomayko/ronn)

#### Morpheus Existing tasks

In the Morpheus Core will exist this tasks:

       # Test Frameworks
       #
       rspec
       test_unit
       bacon
       cucumber

       # Documentation
       #
       rdoc
       yardoc      

       # Backup
       #
       backup

       # Metrics
       #
       stats
       simplecov
       rcov

       # Ruby Extensions
       #
       ruby_extension

       # Clean stuff
       #
       clean
       clobber

**I don't know if this will be a other gem that will be a dependency or will be in the same gem.**

#### Shell Helpers

* Create a many shell helpers to use in the tasks. Shell Helpers:

		#ask - Make a question
		#git - Run a git command
		#say - Say something in a stream
		#run - Run an shell command
		#run_without_aborting - Run a shell command and if have error continues
		#ruby - Run the ruby command
		#python - Run the python command
		#java - Run the java command
		#mysql - Run the mysql command

#### Options Parser

The Options Parser need to parse the arguments and the options for each of this types: Strings, Arrays, Hashes, Numeric and Booleans

Usage:

      class Tasks < Morpheus::Base
        options :foo => :string, :bar => :hash

        def	foo_bar
          # puts options # => { :foo => 'fuuuu', :bar => { 'abc' => 'abc', 'zzz' => 'zzz' } }
        end
      end

      $ task foo_bar --foo fuuuu --bar abc:abc zzz:zzz

#### Binaries

Create a way that users can build robust binaries with Morpheus
Suppose that I want to create a binary file called super_ls to list some directories

     class SuperLs < Morpheus::Binary
       options :root => :boolean, :usr => :string
       
       run do
         if root? # options[:root] == true
           system('ls /')
         end
       end
     end

     SuperLs.run!(ARGV)

And in the command line

     $ super_ls --root

Will list all the files.


### Generators

Create the generators class that uses many file manipulations

    class CustomGenerator < Morpheus::Generator
      arguments :controller # this method will be in Options Parser
    
      def create_abc_file
        create_file 'abc.txt'
      end
    
      def create_controller_class
        template('controller.rb', "app/controllers/#{controller}.rb")
      end
    end

Run with:

    $ task g custom MySuper

To test this generator:

    class CustomGeneratorTest < Morpheus::GeneratorTestCase
       arguments %w(MySuper)

       def test_controller_file_should_exist
         run_generator
         assert_file 'app/controllers/my_super.rb' do |content|
           assert_match /class MySuper/, content
         end
       end
    end

System Helpers
--------------

Create this methods that will return true or false:


 * yarv?
 * jruby?
 * macruby?
 * ree?
 * rubinius?

SO:

 * windows?
 * bsd?
 * linux?
 * mac?
 * solaris?
