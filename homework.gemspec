# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tiyo_hw/version"

Gem::Specification.new do |spec|
  spec.name          = "tiyo_hw"
  spec.version       = TiyoHw::VERSION
  spec.authors       = ["Russell Osborne"]
  spec.email         = ["russell@burningpony.com"]

  spec.summary       = "Quickly Clone and setup basic ruby and JS projects."
  spec.description   = "Quickly Clone and setup basic ruby and JS projects."
  spec.homepage      = "https://www.theironyard.com."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "activesupport"
  spec.add_dependency "json"
  spec.add_dependency "newline_cli"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
