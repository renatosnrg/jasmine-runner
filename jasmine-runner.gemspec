# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jasmine/runner/version'

Gem::Specification.new do |gem|
  gem.name          = "jasmine-runner"
  gem.version       = Jasmine::Runner::VERSION
  gem.authors       = ["Renato Neves"]
  gem.email         = ["renato.neves@coffeebeantech.com"]
  gem.description   = %q{Run Jasmine specs using the Rails 3 Asset Pipeline and headlessly with PhantomJS}
  gem.summary       = %q{Run Jasmine specs with support to Rails 3 Asset Pipeline, PhantomJS and Teamcity CI}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
