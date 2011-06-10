#!/usr/bin/env ruby

:reblog.tasks do # This is the same as class ReblogTasks < Morpheus::Base; end
  rspec :spec, :format => :progress
  rspec :rspec,:format => :documentation
  backup :backup => :source, :with => :gzip
  rdoc :doc
  
  task :do_something do
    puts options
  end
  
  def do_other_thing(options)
    puts options
  end
end

#!/usr/bin/env ruby
:morpheus.tasks do # This is the same as class MorpheusTasks < Morpheus::Base; end
  rspec :ruby_versions => %w(1.9.2 ree)
  rdoc  :title => 'Morpheus - Task Framework'
  rcov
  cucumber :format => :progress, :ruby_versions => %w(1.9.2 ree)
  clobber  :rm_rf => %w(doc pkg tmp coverage)
end

class Task < Morpheus::Base
  rspec    :spec, :format => :progress
  rspec    :rspec, :format => :documentation
  cucumber :features, :format => :html
  backup   :backup, :source, :with => :gzip
  backup   :backup_database, :database, :with => :zip
  backup   :backup_all, :all, :with => :gzip
  rdoc     :doc
  
  task :do_something do
    puts options # task too!
  end
  
  def do_other_thing(options)
    puts options # task too!
  end

end

# >> task = Task.new
# >> task.respond_to?(:do_something) # true
# >> task.respond_to?(:do_other_thing) # true
# >> task.respond_to?(:spec) # true
# >> task.do_something # Invoke task
# $ task list


# HOW WILL works INSIDE ( To make the Dsl works)
#
class RSpecTask < Morpheus::TaskMethod
  method_name :rspec
  
  def call(options)
    puts options # => { :ruby_versions => '1.8.7,1.9.2', :format => :progress }
  end

end

class RubyBinary < Morpheus::TaskMethod
  task_name :ruby
  
  def call(options)
    puts options # => { :load_path => %w(lib spec) }
  end
end

class Task < Morpheus::Base
  rspec :spec, :format => :progress
end

class OtherTask < Morpheus::Base
  use_class_as_namespace! # Namespace
  rspec :spec, :format => :documentation
end

# $ task spec # rspec --format progress

# $ task other_task:spec # rspec --format documentation

# Some Helpers to use in the task and methods

# linux?
# freebsd?
# windows?
# bsd?
# mac_os?

# Binaries

# Ruby Binary
# Java Binary
# Python Binary
# GCC

