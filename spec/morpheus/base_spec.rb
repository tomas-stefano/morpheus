require 'spec_helper'

module Morpheus
  describe Base do

    class MyTasks < Morpheus::Base
    end

    class OtherTasks < Morpheus::Base
    end

    describe '.subclasses' do

      it 'should include the subclass' do
        Base.subclasses.should include(MyTasks, OtherTasks)
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