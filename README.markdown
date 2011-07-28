Morpheus
========

An optioned task library that helps you to automate tasks with simple and clean code.

## Installation

    gem install morpheus

## Usage

Imagine that you want create some rubygem called **alice**. Create a file called Tasks or tasks.rb:

```ruby
   class AliceTasks < Morpheus::Base
     rubygems :alice
     rspec
     rdoc
     stats
     default :rspec
   end
```