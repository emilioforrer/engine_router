$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "engine_router/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "engine_router"
  s.version     = EngineRouter::VERSION
  s.authors     = ["Emilio Forrer"]
  s.email       = ["dev.emilio.forrer@gmail.com"]
  s.homepage    = "https://github.com/emilioforrer/engine_router"
  s.summary     = " Router system for engines so it doesn't load routes twice."
  s.description = " Router system for engines so it doesn't load routes twice."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"

end
