RSpec::Matchers.define :have_task do |task_name|
  match do |tasks|
    tasks.should be_instance_of(Array)
    tasks.should_not be_empty
    tasks.each do |task|
      task.task_name.should == task_name
    end
  end
end