Gem::Specification.new do |spec|
  spec.name          = 'lita-eval'
  spec.version       = '0.2.0'
  spec.authors       = ['Sergey Nartimov']
  spec.email         = ['just.lest@gmail.com']
  spec.description   = %q{A Lita handler for evaluating ruby code.}
  spec.summary       = %q{A Lita handler for evaluating ruby code.}
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '~> 4.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 2.14'
  spec.add_development_dependency 'webmock', '~> 1.22'
end
