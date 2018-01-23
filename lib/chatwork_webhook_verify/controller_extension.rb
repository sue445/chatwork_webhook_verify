module ChatworkWebhookVerify
  module ControllerExtension
    def verify_chatwork_webhook_signature!(token = nil)
      ChatworkWebhookVerify.verify!(
        token:     token,
        body:      request.env["rack.input"].read,
        signature: request.headers["X-ChatWorkWebhookSignature"],
      )
    end
  end
end
