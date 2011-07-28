require 'spec_helper'

module Morpheus
  describe Generator do
    describe '.subclasses' do
      it 'should return all subclasses that inherited from Binary' do
        Generator.subclasses.should include(ControllerGenerator, CrudGenerator)
      end
    end
  end
end