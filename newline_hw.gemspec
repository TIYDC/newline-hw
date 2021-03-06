# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "newline_hw/version"

Gem::Specification.new do |spec|
  spec.name          = "newline_hw"
  spec.version       = NewlineHw::VERSION
  spec.authors       = ["Russell Osborne"]
  spec.email         = ["russell@theironyard.com"]

  spec.summary       = "Quickly Clone and setup basic ruby and JS projects."
  spec.description   = "Quickly Clone and setup basic ruby and JS projects."
  spec.homepage      = "https://online.theironyard.com."
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
  spec.required_ruby_version = '>= 2.2.2'
  spec.add_dependency "activesupport", ">= 5.0"
  spec.add_dependency "json", ">= 2.0.0"
  spec.add_dependency "thor", "~> 0.19.1"
  spec.add_dependency "excon", ">= 0.46.0"
  spec.add_dependency "netrc", "~> 0.11.0"
  spec.add_dependency "jwt", ">= 1.5.6"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "webmock", "~> 2.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
