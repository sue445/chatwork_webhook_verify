$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "chatwork_webhook_verify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "chatwork_webhook_verify"
  s.version     = ChatworkWebhookVerify::VERSION
  s.authors     = ["sue445"]
  s.email       = ["sue445@sue445.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ChatworkWebhookVerify."
  s.description = "TODO: Description of ChatworkWebhookVerify."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0.beta2"
end
