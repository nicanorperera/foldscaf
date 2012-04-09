# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "foldscaf"
  s.version     = Foldscaf::VERSION
  s.authors     = ["Nicanor Perera"]
  s.email       = ["nicanorperera@gmail.com"]
  s.homepage    = "http://github.com/nicanorperera/foldscaf"
  s.summary     = %q{Generadores adaptados a las necesidades de Xaver}
  s.description = %q{Generadores adaptados a las necesidades de Xaver}

  s.rubyforge_project = "foldscaf"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
