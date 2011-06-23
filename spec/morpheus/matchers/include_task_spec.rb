require 'spec_helper'

describe "should include_task(expected_task_name)" do

  context 'for a Task target' do
    it 'passes if target includes expected task name' do
      [new_task(:example)].should include_task(:example)
    end

    it "fails if target does not include expected" do
      lambda {
        [new_task(:other)].should include_task(:dont_exist)
      }.should fail_spec
    end

  end

  context "for an array target" do
    it "passes if target includes all items" do
      [new_task(:exist_too), new_task(:exist)].should include_task(:exist_too, :exist)
    end

    it "fails if target does not include any one of the items" do
      lambda {
        [new_task(:time), new_task(:date)].should include_task(:time, :hour)
      }.should fail_spec
    end
  end

end

describe "should_not include_task(expected_task_name)" do
  context "for a Task target" do
    it "passes if target does not include expected" do
      [new_task(:date)].should_not include_task(:hour)
    end

    it "fails if target includes expected" do
      lambda {
        [new_task(:date)].should_not include_task(:date)
      }.should fail_spec
    end
  end

  context "for an array target" do
    it "passes if target does not include expected" do
      [new_task(:date), new_task(:time)].should_not include_task(:hour)
    end

    it "fails if target includes expected" do
      lambda {
        [new_task(:my_task), new_task(:datetime)].should_not include_task(:datetime)
      }.should fail_spec
    end
  end

end