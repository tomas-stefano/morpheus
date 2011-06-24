require 'spec_helper'

module Morpheus
  describe FindTask do
    describe '.where' do
      it 'should find the task by the task name' do
        FindTask.where(:task_name => 'example').should have_task(:example)
      end

      it 'should find task by the task name and the namespace' do
        FindTask.where(:task_name => 'task_example:example').should have_task(:example).from_namespace(TaskExample)
      end

      it 'should return nothing if pass a inexistent namespace' do
        FindTask.where(:task_name => 'dont_exist_namespace:example').should be_empty
      end

      it 'should return nothing if pass a inexistent task name' do
        FindTask.where(:task_name => 'this_task_dont_exist').should be_empty
      end
    end
  end
end