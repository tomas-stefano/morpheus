['include_task', 'have_task'].each do |file|
  require "morpheus/matchers/#{file}"
end

# Morpheus::Matchers provides a number of useful Matchers we use to compose
# expectations to Task, Namespaces and features of Morpheus.
#
module Morpheus
  module Matchers
    begin
      include RSpec::Matchers
    rescue NameError
      puts 'Appears that you wanna use Morpheus::Matchers, but dont forget to require rspec first!'
    end
  end
end