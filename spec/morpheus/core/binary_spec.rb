require 'spec_helper'

module Morpheus
  describe Binary do
    describe '.subclasses' do
      it 'should return all subclasses that inherited from Binary' do
        Binary.subclasses.should include(SuperLs, GitExample)
      end
    end
    
    describe "#argv" do
      it "should keep the argv" do
        Binary.new('--test', 'rspec', '--app', 'rails').argv.should == %w(--test rspec --app rails)
      end
    end
    
    describe "#run!" do
      it "should invoke the default hook when the args in empty" do
        SuperLs.new.run!.should == '#default method called!'
      end
      
      it "should invoke the default setup in the class scope" do
        GitExample.new.run!.should == "Git clone!"
      end
    end
    
    describe ".options" do
      it "should return the options setup in the Binary scope" do
        GitExample.options.should == {:squash => :string, :author => :string}
      end
    end
  end
end