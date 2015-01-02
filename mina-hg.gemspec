# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/hg/version'

Gem::Specification.new do |spec|
  spec.name          = 'mina-hg'
  spec.version       = Mina::Hg::VERSION
  spec.authors       = ['Nathan Palmer']
  spec.email         = ['nathan@nathanpalmer.com']
  spec.description   = %q{Hg tasks for Mina}
  spec.summary       = %q{Hg tasks for Mina}
  spec.homepage      = 'https://github.com/apsure/mina-hg'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'mina'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
