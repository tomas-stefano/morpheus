module Morpheus
  class LoaderTasks
    def initialize
      load File.expand_path('Tasks', Dir.pwd)
    end
  end
end