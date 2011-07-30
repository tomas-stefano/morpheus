require 'spec_helper'

module Morpheus
  describe Description do
    describe "#parse!" do
      it "should return the description for method" do
        Description.new(App.find_task(:list)).parse!.should == "Listing things from apps"
      end

      it "should return an empty description when not have description" do
        Description.new(App.find_task(:task_without_comment)).parse!.should == ''
      end
      
      it "should return an empty description when file dont exist" do
        mock(App).filename { "app/file/dont_exist"}
        Description.new(App.find_task(:list)).parse!.should == ""
      end
    end
  end
end