require "chatwork_webhook_verify/configuration"

module ChatworkWebhookVerify
  # @return [ChatworkWebhookVerify::Configuration]
  def self.config
    @config ||= Configuration.new
  end
end
