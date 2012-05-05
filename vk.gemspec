# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vk/version"

Gem::Specification.new do |s|
  s.name        = "vk"
  s.version     = Vk::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dmitrii Golub"]
  s.email       = ["dmitrii.golub@gmail.com"]
  s.homepage    = "http://github.com/Houdini/vk_api"
  s.summary     = %q{}
  s.description = %q{}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


  s.add_runtime_dependency "faraday", "~> 0.7.4"
  s.add_runtime_dependency "faraday_middleware", "~> 0.7.0"
  s.add_runtime_dependency 'hashie', '>= 1.2.0'
  s.add_runtime_dependency 'multi_json', '>= 1.0.0'

  s.add_development_dependency("bundler")
  s.add_development_dependency("webmock", '1.6.2')
  s.add_development_dependency("rake")
  s.add_development_dependency("rspec", "~> 2.6")
  s.add_development_dependency("yard", '>= 0.7.1')
end
