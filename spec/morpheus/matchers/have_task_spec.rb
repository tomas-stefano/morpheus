require 'spec_helper'

describe "should have_task(expected_task_name)" do

  context 'for a Task target' do
    it 'passes if target haves expected task name' do
      [new_task(:example)].should have_task(:example)
    end

    it "fails if target does not have expected" do
      lambda {
        [new_task(:other)].should have_task(:dont_exist)
      }.should fail_spec
    end

    it 'fail if target contain other task' do
      @time_task = new_task(:time)
      @tasks = [new_task(:date), @time_task]
      lambda {
        @tasks.should have_task(:date)
      }.should fail_with("expected #{@tasks} to have ONLY task :date")
    end

  end

end

describe "should_not have_task(expected_task_name)" do
  context "for a Task target" do
    it "passes if target does not have expected" do
      [new_task(:date)].should_not have_task(:hour)
    end

    it "fails if target haves expected" do
      lambda {
        [new_task(:date)].should_not have_task(:date)
      }.should fail_spec
    end

    it 'pass if pass a non task array' do
      [1,2,3,4].should_not have_task(:abc)
    end

  end

end