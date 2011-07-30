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
      
      it "should return the provided tasks" do
        SimpleTasks.should have_task(:test_unit, :doc)
      end
    end
    
    describe ".description" do
      it "should be possible calling method in the subclass and overide the defaults" do
        OverrideDescriptionSecondVersion.description.should equal MyDescription
      end
      
      it "should be possible to set with equal sign in the subclass" do
        OverrideDescriptionTask.description.should equal MyDescription
      end
      
      it "Morpheus::Description should be the default description class" do
        App.description.should equal Morpheus::Description
      end
      
      it "should be possible to set the description class" do
        FactoryExampleTasks.description = MyDescription
        FactoryExampleTasks.description.should equal MyDescription
      end
    end
    
    describe ".filename" do
      it "should return the filename that task is defined" do
        App.filename.should == File.expand_path("spec/samples/core/tasks/app.rb")
      end
    end
  end
end