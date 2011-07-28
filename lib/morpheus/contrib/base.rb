%w(
  backup
  clean
  clobber
  cucumber
  rdoc
  rspec
  ruby_extension
  stats
  test_unit
  yardoc
).each do |file|
  require "morpheus/contrib/#{file}"
end