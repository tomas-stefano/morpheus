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
        create_options('--dont' => :string)
        parse_options('--dont', 'drink').should == { :dont => 'drink' }
      end

      it 'should parse booleans and return false when dont pass the boolean' do
        create_options('--list' => :string, '--skip' => :boolean)
        options = parse_options('--list', 'helpers', '--another', 'just_another')
        options['boolean'].should equal false
      end

    end
  end
end