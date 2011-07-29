require 'spec_helper'

module Morpheus
  describe Description do
    it "should return the description for method" do
      Description.new(App.find_task(:list)).should == "Listing things from apps"
    end
    
    it "should return an empty description when not have description" do
      Description.new(App.find_task(:task_without_comment)).should == ''
    end
  end
end