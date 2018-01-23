require "chatwork_webhook_verify/configuration"
require "chatwork_webhook_verify/railtie" if defined?(Rails)

module ChatworkWebhookVerify
  require "base64"
  require "openssl"

  class InvalidSignatureError < StandardError; end

  # Whether signature is valid
  #
  # @param token     [String] webhook token (default: `ChatworkWebhookVerify.config.token`)
  # @param body      [String] request body
  # @param signature [String] chatwork_webhook_signature or X-ChatWorkWebhookSignature
  #
  # @return [Boolean]
  #
  # @note Either `token` or `ChatworkWebhookVerify.config.token` is required
  def self.verify?(token: nil, body:, signature:)
    token ||= config.token

    raise "Either token or ChatworkWebhookVerify.config.token is required" if !token || token.empty?
    raise "signature is required" if !signature || signature.empty?

    generate_signature(token: token, body: body) == signature
  end

  # Whether signature is valid
  #
  # @param token     [String] webhook token (default: `ChatworkWebhookVerify.config.token`)
  # @param body      [String] request body
  # @param signature [String] chatwork_webhook_signature or X-ChatWorkWebhookSignature
  #
  # @raise [InvalidSignatureError] signature is invalid
  #
  # @note Either `token` or `ChatworkWebhookVerify.config.token` is required
  def self.verify!(token: nil, body:, signature:)
    raise InvalidSignatureError unless verify?(token: token, body: body, signature: signature)
  end

  # @param token [String]
  # @param body [String]
  #
  # @return [String]
  def self.generate_signature(token:, body:)
    secret_key = Base64.decode64(token)
    Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new("sha256"), secret_key, body))
  end

  # @return [ChatworkWebhookVerify::Configuration]
  def self.config
    @config ||= Configuration.new
  end
end
