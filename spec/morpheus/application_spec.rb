require 'spec_helper'

module Morpheus
  describe Application do

    describe '#namespaces' do
      before do
        subject.add_namespace(Namespace.new(:wonderland))
      end

      it { subject.namespaces.should be_instance_of(Array) }

      it { subject.namespaces.should_not be_empty }

      it 'namespaces should return a Array with instances of Namespace' do
        subject.namespaces.each do |namespace|
          namespace.should be_instance_of(Morpheus::Namespace)
        end
      end
    end

    describe '#add_namespace' do
      it 'should add namespace to namespace inatance variable' do
        block = Proc.new {}
        namespace = Namespace.new(:alice_tasks, &block)
        subject.add_namespace(namespace).should == [namespace]
      end
    end

    describe '#dont_have_tasks?' do
      it 'should return false when dont have tasks' do
        subject.should_receive(:namespaces).and_return([])
        subject.dont_have_tasks?.should be_true
      end

      it 'should return true when have tasks' do
        namespace = Namespace.new(:alice)
        namespace.should_receive(:tasks).and_return([5, 1,2,3,4])
        subject.should_receive(:namespaces).and_return([namespace])
        subject.dont_have_tasks?.should be_false
      end
    end

    describe '#tasks' do
      it 'should return all the tasks in all namespaces' do
        application.tasks.should include_task(:example, :default)
      end
    end

  end
end