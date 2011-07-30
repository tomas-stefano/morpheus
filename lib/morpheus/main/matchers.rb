module Morpheus
  module Main
    module Matchers
      include RSpec::Matchers  
      # :call-seq:
      #   should have_task(expected)
      #   should_not have_task(expected)
      #
      # Passes if actual.tasks.include?(expected)
      #
      # == Examples
      #
      #   Example.should have_task(:example)
      #   Example.should have_task(:list, :help)
      #   Example.should_not have_task(:require)
      #
      def have_task(*tasks)
        Matcher.new :have_task, *tasks do |*_expected_|          
          match_for_should do |actual|
            _expected_.all? { |expected| actual.tasks.collect(&:name).include?(expected) }
          end
          
          match_for_should_not do |actual|
            _expected_.none? { |expected| actual.tasks.collect(&:name).include?(expected) }
          end
          
          failure_message_for_should do |actual|
            "expected #{actual.tasks} to have tasks #{_expected_}"
          end

          failure_message_for_should_not do |actual|
            "expected #{actual.tasks} to not have tasks #{_expected_}"
          end          
        end
      end
    end
  end
end