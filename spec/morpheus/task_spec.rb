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
        task = new_task(:example) {}
        task.namespace.should equal DefaultNamespace
      end

      it 'should add the task instance to namespace instance' do
        task = new_task(:other_excelent_task, MyClass)
        Morpheus.application.get_namespace(MyClass).tasks.should include(task)
      end
    end

    def new_task(task_name, klass = DefaultNamespace, &block)
      Task.new(task_name, namespace: klass, &block)
    end

  end
end