#!/usr/bin/env ruby
source :rubygems

group :deps do
  gem 'active_support'
  gem 'i18n'
end

group :test do
  gem 'infinity_test', :git => 'git@github.com:tomas-stefano/infinity_test.git'
  gem 'rspec', '2.6.0'
  gem 'cucumber', '1.0.0'
  gem 'aruba', '0.3.7'
  gem 'rr', '1.0.3'
end

platform :mri_19 do
  gem 'ruby-debug19', :require => false
end