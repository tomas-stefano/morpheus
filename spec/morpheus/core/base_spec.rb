require 'spec_helper'

module Morpheus
  describe Base do
    describe '.subclasses' do
      it 'should return all subclasses that Base class have' do
        Base.subclasses.should include(SimpleTasks)
      end
    end
    
    describe ".tasks" do
      it "should return all the tasks from Base subclasses" do
        App.should have_task(:list, :help)
      end
      
      it "should not include tasks that is private methods" do
        App.should_not have_task(:internal_implementation)
      end
      
      it "each element should be instance of Morpheus::Task" do
        App.tasks.all? { |element| element.should be_instance_of(Morpheus::Task) }
      end
    end
    
    describe "#filename" do
      it "should return the filename that task is defined" do
        App.filename.should == File.expand_path("spec/samples/core/tasks/app.rb")
      end
    end
  end
end