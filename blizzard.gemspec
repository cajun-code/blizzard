# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "blizzard/version"

Gem::Specification.new do |s|
  s.name        = "blizzard"
  s.version     = Blizzard::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Allan Davis"]
  s.email       = ["javaalley@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/blizzard"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "blizzard"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.dependency "gosu"
end
