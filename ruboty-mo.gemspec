# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/mo/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-mo"
  spec.version       = Ruboty::Mo::VERSION
  spec.authors       = ["misyobun"]
  spec.email         = ["naoto0101@gmail.com"]
  spec.summary       = "ruboty tells you mona_jpy"
  spec.homepage      = "http://www.vagrantup.jp"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware-parse_oj"
  spec.add_runtime_dependency "ruboty"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
