%w(
  backup
  clean
  clobber
  cucumber
  rdoc
  rspec
  rubygems
  ruby_extension
  stats
  test_unit
  yardoc
).each do |file|
  require "morpheus/contrib/#{file}"
end