require 'spec_helper'

module Morpheus
  describe Generator do
    describe '.subclasses' do
      it 'should return all subclasses that inherited from Binary' do
        Generator.subclasses.should include(ControllerGenerator, CrudGenerator)
      end
    end
    
    describe ".method_added" do
      it "should include all methods added as a task to run" do
        pending
      end
    end
  end
end