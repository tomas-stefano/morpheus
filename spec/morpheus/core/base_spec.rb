require 'spec_helper'

module Morpheus
  describe Base do
    describe '.subclasses' do
      it 'should return all subclasses that Base class have' do
        Base.subclasses.should include(SimpleTasks)
      end
    end
  end
end