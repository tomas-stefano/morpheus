require 'aruba/cucumber'

module MorpheusFeaturePath
  def self.path
    "#{binary_dir}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
  end

  def self.binary_dir
    "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}"
  end
end

ENV['PATH'] = MorpheusFeaturePath.path

# Hooks from aruba
#
# @announce-cmd
#
# @announce-stdout
#
# @announce-stderr
#
# @announce-dir
#
# @announce