require 'rake'

Gem::Specification.new do |s|
  s.name          = 'json-rules'
  s.license       = 'MIT'
  s.version       = '0.0.0'
  s.bindir        = 'bin'
  s.executables   = %w(json_rules)
  s.authors       = %w(someguy)
  s.summary       = 'json-rules'
  s.description   = 'Auditing tool for JSON document'
  s.homepage      = 'https://github.com/stelligent/json_rules'
  s.files         = FileList[ 'lib/**/*.rb' ]

  s.require_paths << 'lib'

  s.required_ruby_version = '~> 2.2'

  s.add_runtime_dependency('trollop', '2.1.2')
  s.add_runtime_dependency('ruby-jq', '0.1.6')
end