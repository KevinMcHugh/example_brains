# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'example_brains/version'

Gem::Specification.new do |spec|
  spec.name          = "example_brains"
  spec.version       = ExampleBrains::VERSION
  spec.authors       = ["Kevin McHugh"]
  spec.email         = ["kev@kevinmchugh.me"]
  spec.summary       = "Example brains for mustached nemesis"
  spec.description   = "there's some good stuff in here"
  spec.homepage      = "https://github.com/KevinMcHugh/example_brains.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
