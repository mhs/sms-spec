# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "text_spec/version"

Gem::Specification.new do |s|
  s.name        = "text_spec"
  s.version     = TextSpec::VERSION
  s.authors     = ["Chris Rittersdorf"]
  s.email       = ["manlycode@gmail.com"]
  s.homepage    = "https://github.com/mhs/text_spec"
  s.summary     = %q{Test SMS interactions with RSpec and Cucumber}
  s.description = %q{Text Spec gives you an RSpec DSL and Cucumber steps to test SMS interactions.}

  s.rubyforge_project = "text_spec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rspec'

  s.add_development_dependency "rspec"
  s.add_development_dependency "twilio-ruby"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
end
