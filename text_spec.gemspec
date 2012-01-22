# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "text_spec/version"

Gem::Specification.new do |s|
  s.name        = "text_spec"
  s.version     = TextSpec::VERSION
  s.authors     = ["Chris Rittersdorf"]
  s.email       = ["manlycode@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "text_spec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
end
