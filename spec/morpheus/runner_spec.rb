require 'spec_helper'

describe Morpheus::Runner do
  let(:runner_class) { Morpheus::Runner }
  let(:list) { runner_class.new(['list']) }
  let(:help) { runner_class.new(['help']) }

  describe '#initialize' do
    it 'should parse argument' do
      list.argument.should equal :list
    end

    it 'should parse argument help' do
      help.argument.should equal :help
    end

    it 'should initialize with the application object' do
      list.application.should be_instance_of(Morpheus::Application)
    end
  end

  describe '#run!' do
    it 'should invoke a task when method dont exist' do
      runner = runner_class.new(['my_super_hiper_task'])
      runner.stub!(:say)
      runner.should_receive(:invoke).with(:my_super_hiper_task)
      runner.run!
    end
  end
end