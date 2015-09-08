$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_service/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_service"
  s.version     = UserService::VERSION
  s.authors     = ["Ashutosh Agrawal"]
  s.email       = ["ashutosh_agrawal@live.in"]
  s.homepage    = ""
  s.summary     = "Summary of UserService."
  s.description = "Description of UserService."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
