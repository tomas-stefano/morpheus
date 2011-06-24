require 'spec_helper'

module Morpheus
  describe Task do
    before do
      class DefaultNamespace < Morpheus::Base
      end
      class MyClass < Morpheus::Base
      end
    end

    describe '#initialize' do
      it 'should keep the task name' do
        task = new_task :example do
          :example
        end
        task.name.should equal :example
      end

      it 'should keep the block of the task' do
        proc = Proc.new { 'a' }
        task = new_task :example, &proc
        task.block.should equal proc
      end

      it 'should keep the namespace' do
        task = new_task(:example, DefaultNamespace)
        task.namespace.should equal DefaultNamespace
      end

      it 'should add the task instance to namespace instance' do
        task = new_task(:other_excelent_task, MyClass)
        Morpheus.application.get_namespace(MyClass).tasks.should include(task)
      end

      it 'should be possible to pass a flag that say this is a method and a task' do
        task = new_task(:is_a_method, default_namespace, :is_a_method? => true)
        task.is_a_method?.should be_true
      end

      it 'should return false when is a normal task' do
        task = new_task(:is_not_a_method)
        task.is_a_method?.should equal false
      end
    end

    describe '#invoke' do
      it 'should call the method when task is a method' do
        task = find_task(:other_method)
        task.invoke.should == 'The result of the other method'
      end

      it 'should call the task with block' do
        task = find_task(:default)
        task.invoke.should == :default
      end

      it 'should call task without a block if the task does not have a block' do
        task = find_task(:task_without_a_block)
        application.should_receive(:task_without_a_block!)
        task.invoke
      end
    end

  end
end