# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'finer_struct/version'

Gem::Specification.new do |spec|
  spec.name          = "finer_struct"
  spec.version       = FinerStruct::VERSION
  spec.authors       = ["Pete Yandell"]
  spec.email         = ["pete@notahat.com"]
  spec.description   = %q{Nicer replacement for Ruby's Struct and OpenStruct}
  spec.summary       = %q{Nicer replacement for Ruby's Struct and OpenStruct}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
