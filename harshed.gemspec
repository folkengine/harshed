# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'harshed/version'

Gem::Specification.new do |spec|
  spec.name          = 'harshed'
  spec.version       = Harshed::VERSION
  spec.authors       = ['Folkengine']
  spec.email         = ['gaoler@electronicpanopticon.com']
  spec.license       = 'MIT'

  spec.summary       = 'Ruby Serializable Hashed Array Utility'
  spec.description   = 'Utility to quickly save and retrieve objects from disk'
  spec.homepage      = 'https://github.com/folkengine/harshed'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'yamlable', '>= 0.0.2'
  spec.add_development_dependency 'bundler', '>= 1.7.6'
  spec.add_development_dependency 'rake', "~> 10.0"
end
