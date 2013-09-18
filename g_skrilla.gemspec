# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'g_skrilla/version'

Gem::Specification.new do |spec|
  spec.name          = "GSkrilla"
  spec.version       = GSkrilla::VERSION
  spec.authors       = ["Edward Price"]
  spec.email         = ["ted.price@gmail.com"]
  spec.description   = %q{TODO: Scrape Google financial statements}
  spec.summary       = %q{TODO: Scrape Google financial statements}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
