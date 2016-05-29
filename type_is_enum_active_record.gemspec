# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'uri'
require 'type_is_enum_active_record/module_info'

Gem::Specification.new do |spec|
  spec.name          = TypeIsEnumActiveRecord::NAME
  spec.version       = TypeIsEnumActiveRecord::VERSION
  spec.authors       = ['Andrew Shcheglov']
  spec.email         = ['godwindock@gmail.com']
  spec.summary       = 'ActiveRecord type for TypeIsEnum'
  spec.description   = 'ActiveRecord type for TypeIsEnum'
  spec.license       = 'MIT'

  origin = `git config --get remote.origin.url`.chomp
  origin_uri = origin.start_with?('http') ? URI(origin) : URI(origin.gsub(%r{git@([^:]+)(.com|.org)[^\/]+}, 'http://\1\2'))
  spec.homepage = URI::HTTP.build(host: origin_uri.host, path: origin_uri.path.chomp('.git')).to_s

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '> 4.2.5'
  spec.add_dependency 'type_is_enum', '~> 0.2.0'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rubocop', '~> 0.32.1'
end
