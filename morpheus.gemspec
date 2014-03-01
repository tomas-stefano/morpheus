# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'morpheus/version'

Gem::Specification.new do |spec|
  spec.name          = "morpheus"
  spec.version       = Morpheus::VERSION
  spec.authors       = ["Tomas D'Stefano"]
  spec.email         = ["tomas_stefano@successoft.com"]
  spec.description   = %q{Full text search}
  spec.summary       = %q{Full text search}
  spec.homepage      = "https://github.com/tomas-stefano/morpheus"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 4.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0.0.beta'
end
