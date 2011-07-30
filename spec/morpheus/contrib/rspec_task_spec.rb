require "spec_helper"

describe RspecTask do
  describe "#name" do
    it "should have a method name" do
      RspecTask.new.name.should == :rspec
    end  
  end
end