# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liquid-validator/version'

Gem::Specification.new do |spec|
  spec.name          = "liquid-validator"
  spec.version       = LiquidValidator::VERSION
  spec.authors       = ["Jeremy W. Rowe"]
  spec.email         = ["jeremywrowe@users.noreply.github.com"]
  spec.description   = %q{Liquid template validator}
  spec.summary       = %q{Validates template strings that are consumed when creating a liquid template. It is simple, that is the point.}
  spec.homepage      = "https://github.com/jeremywrowe/liquid-validator"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('liquid', '>= 2.4.0')

  spec.add_development_dependency "bundler", "~> 1.16.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "appraisal"
end
