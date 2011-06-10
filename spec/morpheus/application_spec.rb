require 'spec_helper'

module Morpheus
  describe Application do
    describe '#tasks' do
      it 'should return a Hash' do
        subject.tasks.should be_instance_of(Hash)
      end
    end
    
    describe '#add_task' do
      let(:namespace_example) { NamespaceExample.new }

      it 'should add a task' do
        subject.add_task(namespace_example)
        subject.tasks.should == { :namespace_example => [namespace_example] }
      end
      
      it 'should keep more than one task' do
        2.times {subject.add_task(namespace_example)}
        subject.tasks.should == { :namespace_example => [namespace_example, namespace_example]}
      end
    end

    class NamespaceExample
      def namespace
        :namespace_example
      end
    end
    
  end
end