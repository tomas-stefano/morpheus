require 'spec_helper'

module Morpheus
  describe Namespace do
    describe '#initialize' do

      before do
        @block = Proc.new { 'a' }
      end

      it 'should tranform the namespace in a class' do
        namespace = Namespace.new(:alice, &@block)
        expect {
          namespace.namespace.should equal AliceTasks
        }.to_not raise_exception
      end

      it 'should keep the block' do
        namespace = Namespace.new(:wonderland, &@block)
        namespace.block.should equal @block
      end

      it 'should keep the original symbol name' do
        namespace = Namespace.new(:rabbit, &@block)
        namespace.symbol_namespace.should equal :rabbit
      end

      it "should camel case the namespace" do
        namespace = Namespace.new(:wonder_land, &@block)
        expect {
          namespace.namespace.should equal WonderLandTasks
        }.to_not raise_exception
      end

      it 'should inherited from Morpheus::Base class' do
        namespace = Namespace.new(:trinity, &@block)
        namespace.namespace.superclass.should equal Morpheus::Base
      end
    end
  end
end