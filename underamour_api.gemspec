lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'underarmour_api/version'

Gem::Specification.new do |s|
  s.add_development_dependency 'bundler', '~> 1.15'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0', '>= 1.0.8'
  s.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'pry', '~> 0.11.0', '>= 0.11.1'
  s.add_development_dependency 'simplecov', '~> 0.13', '>= 0.13.0'
  s.add_development_dependency 'vcr', '~> 3.0', '>= 3.0.3'
  s.add_development_dependency 'webmock', '~> 3.0', '>= 3.0.3'
  # s.add_development_dependency 'yard'

  s.add_runtime_dependency 'httparty', '~> 0.15.6', '>= 0.15.0'
  s.add_runtime_dependency('json')
  s.add_runtime_dependency 'oauth2', '~> 1.0'

  s.authors               = ['Ifat Ribon']
  s.bindir                = 'exe'
  s.description           = 'Ruby wrapper for authorizing account and retrieving data from UnderArmour API'
  s.email                 = ['iribon9@gmail.com']
  s.executables           = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.files                 = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage              = 'https://github.com/inveterateliterate/underarmour_api'
  s.license               = 'MIT'
  s.name                  = 'underarmour_api'
  s.require_paths         = ['lib']
  s.required_ruby_version = '>= 2.0.0'
  s.summary               = 'Ruby wrapper for UnderArmour API'
  s.version               = UnderarmourApi::VERSION

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if s.respond_to?(:metadata)
  #   s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  # end
end
