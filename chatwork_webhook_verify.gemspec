$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "chatwork_webhook_verify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chatwork_webhook_verify"
  s.version     = ChatworkWebhookVerify::VERSION
  s.authors     = ["sue445"]
  s.email       = ["sue445@sue445.net"]
  s.homepage    = "https://github.com/sue445/chatwork_webhook_verify"
  s.summary     = "Verify ChatWork webhook signature"
  s.description = "Verify ChatWork webhook signature"
  s.license     = "MIT"

  s.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "actionpack"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "railties"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "yard"
end
