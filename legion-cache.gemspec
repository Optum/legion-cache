# frozen_string_literal: true

require_relative 'lib/legion/cache/version'

Gem::Specification.new do |spec|
  spec.name = 'legion-cache'
  spec.version       = Legion::Cache::VERSION
  spec.authors       = ['Esity']
  spec.email         = %w[matthewdiverson@gmail.com ruby@optum.com]

  spec.summary       = 'Wraps both the redis and dalli gems to make a consistent interface for accessing cached objects'
  spec.description   = 'A Wrapper class for the LegionIO framework to interface with both Memcached and Redis for caching purposes'
  spec.homepage      = 'https://github.com/Optum/legion-cache'
  spec.license       = 'Apache-2.0'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4'
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.test_files        = spec.files.select { |p| p =~ %r{^test/.*_test.rb} }
  spec.extra_rdoc_files  = %w[README.md LICENSE CHANGELOG.md]
  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/Optum/legion-cache/issues',
    'changelog_uri' => 'https://github.com/Optum/legion-cache/src/main/CHANGELOG.md',
    'documentation_uri' => 'https://github.com/Optum/legion-cache',
    'homepage_uri' => 'https://github.com/Optum/LegionIO',
    'source_code_uri' => 'https://github.com/Optum/legion-cache',
    'wiki_uri' => 'https://github.com/Optum/legion-cache/wiki'
  }

  spec.add_dependency 'connection_pool', '>= 2.2.3'
  spec.add_dependency 'dalli', '>= 2.7'
  spec.add_dependency 'legion-logging'
  spec.add_dependency 'legion-settings'
  spec.add_dependency 'redis', '>= 4.2'
end
