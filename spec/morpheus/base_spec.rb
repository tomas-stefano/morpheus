require 'spec_helper'

module Morpheus
  describe Base do

    describe '.subclasses' do

      it 'should include the subclass' do
        Base.subclasses.should include(AppTasks, OtherTasks)
      end

      it 'should keep all the subclasses' do
        Base.subclasses.should be_instance_of(Array)
      end

      it 'should have an alias called namespaces' do
        Base.namespaces.should equal Base.subclasses
      end

    end
  end
end