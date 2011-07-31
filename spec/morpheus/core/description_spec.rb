require 'spec_helper'

module Morpheus
  describe Description do
    let(:list_task) { App.find_task(:list) }
    describe "#parse!" do
      it "should return the description for method" do
        Description.new(list_task).parse!.should == "Listing things from apps"
      end
      
      it "should return all lines if have more comment lines" do
        help_task = App.find_task(:help)
        Description.new(help_task).parse!.should == "Listing Banner for lost users\nSimple Explain in how to use the App\n:)"
      end

      it "should return an empty description when not have description" do
        Description.new(App.find_task(:task_without_comment)).parse!.should == ''
      end
      
      it "should return an empty description when file dont exist" do
        mock(App).filename { "app/file/dont_exist"}
        Description.new(list_task).parse!.should == ""
      end
      
      it "should not raise error if don't find the namespace" do
        description = Description.new(list_task)
        mock(description.results).classes { [] }
        description.parse!.should == ''
      end
      
      it "should not raise error if don't find the method in method list" do
        description = Description.new(list_task)
        mock(description).find_method { nil }
        description.parse!.should == ''
      end
    end
  end
end