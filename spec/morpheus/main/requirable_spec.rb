require 'spec_helper'

module Morpheus
  describe Requirable do
    describe "#name" do
      it "should return the name to require" do
        Requirable.new(:all).name.should equal :all
      end
      
      it "should return the first argument when pass some options" do
        Requirable.new(:app, :directory => 'blah =p').name.should equal :app
      end
    end
    
    describe "#directory" do
      it "should return tasks as default directory to look tasks files" do
        Requirable.new(:all).directory.should == File.join(Dir.pwd, 'tasks')
      end
      
      it "should be possible to override this behavior" do
        directory = 'spec/samples/core/tasks'
        Requirable.new(:all, :directory => directory).directory.should == directory
      end
    end
    
    describe "#require!" do
      before do
        mock(Dir).pwd { File.expand_path("spec/samples/core")}
      end
      
      it "should return true when require all tasks files" do
        Requirable.new(:all).require!.should be_true
      end
      
      it "should raise error when not have ruby file to require" do
        expect { 
          Requirable.new('dont_exist').require! 
        }.to raise_error(LoadError)
      end
      
      it "should require the file as .rb extension too" do
        Requirable.new('app').require!.should be_true
      end
    end
  end
end