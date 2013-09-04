# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dbd_onto/version'

Gem::Specification.new do |spec|
  spec.name          = "dbd_onto"
  spec.version       = DbdOnto::VERSION
  spec.authors       = ["Peter Vandenabeele"]
  spec.email         = ["peter@vandenabeele.com"]
  spec.description   = %q{Ontologies for Dbd}
  spec.summary       = %q{Ontologies for Dbd}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '>= 1.3.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'terminal-notifier-guard'
  spec.add_development_dependency 'yard'
  spec.add_runtime_dependency 'rdf'
  spec.add_runtime_dependency 'ruby_peter_v', '>= 0.0.11'
  spec.add_runtime_dependency 'dbd', '>= 0.0.19'
end
