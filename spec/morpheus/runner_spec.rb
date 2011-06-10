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
    
    it 'should initialize with the instance of tasks file loader' do
      help.loader_tasks.should be_instance_of(Morpheus::LoaderTasks)
    end
    
    it 'should initialize with the application object' do
      list.application.should be_instance_of(Morpheus::Application)
    end
  end
end