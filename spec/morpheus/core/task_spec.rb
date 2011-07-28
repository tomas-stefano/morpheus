require 'spec_helper'

module Morpheus
  describe Task do
    describe '.subclasses' do
      it 'should return all base methods that added by subclasses of Task' do
        Task.subclasses.should include(RubygemExample, ExampleTask, RdocExample)
      end
    end

    describe '.method_name' do
      it 'should return the method name from superclass' do
        ExampleTask.method_name.should equal :example_task
      end

      it 'should return the defined method in the class itself' do
        RubygemExample.method_name.should equal :rubygems
      end

      it 'should return the method name setting in the subclass' do
        RdocExample.method_name.should equal :rdocxyz
      end
    end
  end
end