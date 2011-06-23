require 'spec_helper'

module Morpheus
  describe FindTask do
    describe '.where' do
      it 'should find the task by the task name' do
        FindTask.where(:task_name => 'example').should include_task(:example)
      end
    end
  end
end