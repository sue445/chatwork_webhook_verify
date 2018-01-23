class WebhookController < ApplicationController
  include ChatworkWebhookVerify::ControllerExtension

  before_action :verify_chatwork_webhook_signature!

  def test
    render plain: "OK", status: 200
  end
end
