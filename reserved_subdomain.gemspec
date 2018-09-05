lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reserved_subdomain/version'

Gem::Specification.new do |s|
  s.name          = 'reserved_subdomain'
  s.version       = ReservedSubdomain::VERSION
  s.authors       = ['Dominic Sayers']
  s.email         = ['dominic@sayers.cc']
  s.summary       = 'Identify subdomain names that should be reserved'
  s.homepage      = 'https://github.com/dominicsayers/reserved_subdomain'
  s.license       = 'MIT'

  s.files = `git ls-files lib LICENSE`.split($RS)
  s.require_paths = ['lib']
end
