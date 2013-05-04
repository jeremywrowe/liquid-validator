# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liquid-validator/version'

Gem::Specification.new do |spec|
  spec.name          = "liquid-validator"
  spec.version       = LiquidValidator::VERSION
  spec.authors       = ["Jeremy W. Rowe"]
  spec.email         = ["jeremy.w.rowe@gmail.com"]
  spec.description   = %q{Liquid template validator}
  spec.summary       = %q{Validates template strings that are consumed when creating a liquid template. It is simple, that is the point.}
  spec.homepage      = "https://github.com/jeremywrowe/liquid-validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('liquid', '>= 2.4.0')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
