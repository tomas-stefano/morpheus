RSpec::Matchers.define :include_task do |task_names|
  match do |tasks|
    tasks.should be_instance_of(Array)
    tasks.should_not be_empty

    all_tasks = tasks.collect { |task| task.name.to_sym }
    all_tasks.include?(task_name.to_sym)
  end
end