$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "stp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "stp_client"
  spec.version     = STP::VERSION
  spec.date        = '2019-12-10'
  spec.summary     = "STP Client is a ruby integration to STP services"
  spec.description = "STP Client is a lib for consuming STP services"
  spec.files       = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.authors     = ["Yellowme"]
  spec.email       = 'hola@yellowme.mx'
  spec.homepage    = 'https://github.com/yellowme/stp-client'
  spec.license      = 'MIT'

  spec.add_dependency "faraday", "~> 1.0"
  spec.add_dependency "crypto_yellowme", ">= 0.4"

  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "faker", "~> 2.0"
  spec.add_development_dependency "simplecov", "~> 0.17"
  spec.add_development_dependency "webmock", "~> 3.4.2"
end
