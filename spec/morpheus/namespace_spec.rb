require 'spec_helper'

module Morpheus
  describe Namespace do
    describe '#initialize' do

      before do
        @block = Proc.new { 'a' }
      end

      describe '#initialize' do
        context 'when it pass a class' do
          let(:namespace) { Namespace.new(:class_name => NamespaceHelperTest) }

          it 'should be possible to pass only the class name' do
            namespace.klass.should equal NamespaceHelperTest
          end

          it 'symbol_namespace should be nil when it pass the klass itself' do
            namespace.symbol_namespace.should be_nil
          end

        end

        context 'using dsl' do
          let(:namespace) { namespace = Namespace.new(:alice, &@block) }

          it 'should tranform the namespace in a class' do
            namespace = Namespace.new(:alice, &@block)
            namespace.klass.should equal AliceTasks
          end

          it 'should keep the block' do
            namespace = Namespace.new(:alice, &@block)
            namespace.block.should equal @block
          end

          it 'should keep the original symbol name' do
            namespace.symbol_namespace.should equal :alice
          end

          it "should camel case the namespace and add Tasks after" do
            namespace = Namespace.new(:wonder_land, &@block)
            namespace.klass.should equal ::WonderLandTasks
          end

          it 'should not added tasks when have the word tasks in the final' do
            namespace = Namespace.new(:wonder_land_tasks, &@block)
            namespace.klass.should equal ::WonderLandTasks
          end

          it 'should inherited from Morpheus::Base class' do
            namespace.klass.superclass.should equal Morpheus::Base
          end

        end
      end

      describe '#using_dsl?' do

        it 'should return false when not use the dsl' do
          namespace = Namespace.new(:class_name => NamespaceHelperTest)
          namespace.using_dsl?.should equal(false)
        end

        it 'should return true when is using the dsl' do
          namespace = Namespace.new(:alice, &@block)
          namespace.using_dsl?.should be_true
        end

      end

      describe '#tasks' do
        let(:namespace) { Namespace.new(:class_name => NamespaceHelperTest)}
        it 'should return an Array' do
          namespace.tasks.should be_instance_of(Array)
        end

        it 'should be possible to push things to tasks' do
          namespace.tasks.push(new_task(:abc))
          namespace.tasks.should have_task(:abc)
        end
      end

      class NamespaceHelperTest
      end

      class WonderLandTasks
      end
    end
  end
end