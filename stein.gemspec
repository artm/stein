# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stein/version'

Gem::Specification.new do |spec|
  spec.name          = "stein"
  spec.version       = Stein::VERSION
  spec.authors       = ["Artem Baguinski"]
  spec.email         = ["femistofel@gmail.com"]
  spec.description   = %q{Write Main modes in separate source files}
  spec.summary       = %q{Write Main modes in separate source files}
  spec.homepage      = "https://github.com/artm/stein"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "main"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
