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
      before do
        Task.register_methods
      end

      it 'should removing the word Task in the subclasses of Task and add class method in the Base scope class' do
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
      
      it "should possible to overide the description parser" do
        Task.new(:list, :description => "Listing stuff").description.should == "Listing stuff"
      end
    end
  end
end