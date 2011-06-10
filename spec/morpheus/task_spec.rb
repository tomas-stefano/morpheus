require 'spec_helper'

module Morpheus
  describe Task do
    describe '#initialize' do
      it 'should keep the task name' do
        task = new_task :example do
          :example
        end
        task.task_name.should equal :example
      end
      
      it 'should keep the block of the task' do
        proc = Proc.new { 'a' }
        task = new_task :example, &proc
        task.block.should equal proc
      end
      
      it 'should keep the namespace' do
        task = new_task(:example) {}
        task.namespace.should equal :default
      end
      
      it 'should add tasks to application object with a namespace' do
        Morpheus.application.should_receive(:add_task)
        task = new_task(:example) {}
      end

    end
    
    def new_task(task_name, &block)
      Task.new(namespace: :default, task_name: task_name, &block)
    end

  end
end