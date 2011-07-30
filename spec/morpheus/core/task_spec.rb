require 'spec_helper'

module Morpheus
  describe Task do
    describe '.subclasses' do
      it 'should return all base methods that added by subclasses of Task' do
        Task.subclasses.should include(RubygemExample, ExampleTask, RdocExample)
      end
    end

    describe '.method_name' do
      it 'should return the method name from superclass and remove the _task word' do
        ExampleTask.method_name.should equal :example
      end

      it 'should return the defined method in the class itself' do
        RubygemExample.method_name.should equal :rubygems
      end

      it 'should return the method name setting in the subclass' do
        RdocExample.method_name.should equal :rdocxyz
      end
    end

    describe '.register_methods' do
      it 'should add class method in the Base scope class and removing Task word from them' do
        Morpheus::Task.register_methods
        Base.methods.sort.should include(:rspec, :rdoc, :ruby_extension, :stats, :yardoc, :backup)
      end
    end
    
    describe "#name" do
      it "should return the name of the task" do
        Task.new(:list).name.should equal :list
      end
    end

    describe "#namespace" do
      it "should keep the namespace of the task" do
        App.find_task(:list).namespace.should equal App
      end
    end
    
    describe "#description" do
      it "should return the comment above the method definition" do
        App.find_task(:list).description.should == "Listing things from apps"
      end
      
      it "should possible to overide the description parser with options" do
        Task.new(:list, :description => "Listing stuff").description.should == "Listing stuff"
      end
      
      it "should be possible to override the behavior with a different description class" do
        OverrideDescriptionTask.find_task(:list).description.should == "Super description"
      end
    end
    
    describe "#provided_by" do
      it "should return the class that this task is provided by" do
        SimpleTasks.find_task(:doc).provided_by.should equal RdocTask
      end
      
      it "should return the same namespace when is task added by the namespace" do
        App.find_task(:list).provided_by.should equal App
      end
    end
    
    describe "#provided_instance" do
      it "should return a instance of provided by class" do
        SimpleTasks.find_task(:doc).provided_instance.should be_instance_of(RdocTask)
      end
    end

    describe "#run" do
      it "should be possible to run a task" do
        App.find_task(:list).run.should == "Listing ..."
      end
      
      it "should be possible to run a provided task" do
        SimpleTasks.find_task(:provided_example_task).run.should == {:format => :doc, :ls => true}
      end
      
      it "should raise error when not have the run method in the subclass" do
        expect {
          SimpleTasks.find_task(:without_run_method).run
        }.to raise_error(NoMethodError, "The class #{WithoutRunMethod} don't have the method #run. The Morpheus convention is to call the #run method for Method::Task subclasses.")
      end
    end
  end
end