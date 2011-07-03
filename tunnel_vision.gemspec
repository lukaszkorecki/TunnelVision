# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tunnel_vision/version"

Gem::Specification.new do |s|
  s.name        = "tunnel_vision"
  s.version     = TunnelVision::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Łukasz Korecki"]
  s.email       = ["lukasz@coffeesounds.com"]
  s.homepage    = ""
  s.summary     = %q{SSH tunnel manager}
  s.description = %q{Easily open and close ssh tunnels required by your project}

  s.rubyforge_project = "tunnel_vision"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
