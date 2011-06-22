require 'spec_helper'

module Morpheus
  describe OptionsParser do

    describe '#initialize' do
      it 'should keep the booleans' do
        create_options(:skip => :boolean).booleans.should include(:skip)
      end

      it 'should keep the strings' do
        create_options(:dont => :string).strings.should include(:dont)
      end
    end

    describe '#parse' do

      it 'should parse strings' do
        pending
        create_options('--dont' => :string)
        parse_options('--dont', 'drink').should == { 'dont' => 'drink' }
      end

      it 'should parse booleans and return false when dont pass the boolean' do
        pending
        create_options('--list' => :string, '--skip' => :boolean)
        opts = parse_options('--list', 'helpers')
        opts['skip'].should equal false
      end

      it 'should parse boolean and return true when the flag is set' do
        pending
        create_options('--skip' => :boolean)
        opts = parse_options('--skip')
        opts['skip'].should be_true
      end

    end
  end
end