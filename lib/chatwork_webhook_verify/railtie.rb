module ChatworkWebhookVerify
  class Railtie < ::Rails::Railtie
    initializer "chatwork_webhook_verify.controller_extension" do
      ActiveSupport.on_load(:action_controller) do
        require "chatwork_webhook_verify/controller_extension"
        ActionController::Metal.include(ChatworkWebhookVerify::ControllerExtension)
      end
    end
  end
end
