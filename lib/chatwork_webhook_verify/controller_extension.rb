module ChatworkWebhookVerify
  module ControllerExtension
    # @param token     [String] webhook token (default: `ChatworkWebhookVerify.config.token`)
    #
    # @raise [InvalidSignatureError] signature is invalid
    def verify_chatwork_webhook_signature!(token = nil)
      ChatworkWebhookVerify.verify!(
        token:     token,
        body:      request.env["rack.input"].read,
        signature: request.headers["X-ChatWorkWebhookSignature"] || params[:chatwork_webhook_signature],
      )
    rescue ChatworkWebhookVerify::InvalidSignatureError
      raise ActionController::BadRequest, "signature is invalid"
    end
  end
end
