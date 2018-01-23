module ChatworkWebhookVerify
  class Engine < ::Rails::Engine
    isolate_namespace ChatworkWebhookVerify
    config.generators.api_only = true
  end
end
