require 'spec_helper'

module Morpheus
  describe Binary do
    describe '.subclasses' do
      it 'should return all subclasses that inherited from Binary' do
        Binary.subclasses.should include(SuperLs, GitExample)
      end
    end
  end
end