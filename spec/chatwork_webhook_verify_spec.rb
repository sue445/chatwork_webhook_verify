RSpec.describe ChatworkWebhookVerify do
  # NOTE: there are valid
  let(:token)     { "iY/hmitgwCBlc5DnjAZ8pyRG1HF0zFflfmKmtCDg1wk=" }
  let(:body)      { '{"webhook_setting_id":"581","webhook_event_type":"mention_to_me","webhook_event_time":1516629767,"webhook_event":{"from_account_id":2861671,"to_account_id":2739132,"room_id":93207172,"message_id":"1007287971738591232","body":"[rp aid=2739132 to=93207172-1007287785163345920] sue445\ntest","send_time":1516629766,"update_time":0}}' }
  let(:signature) { "NTIUzbXiwLvM7C/MT3Kd75Lw1w2N5tyWtcEieKiqhY0=" }

  describe ".verify?" do
    subject { ChatworkWebhookVerify.verify?(token: token, body: body, signature: signature) }

    context "with valid signature" do
      it { should eq true }
    end

    context "with invalid signature" do
      let(:signature) { "AAAAAAAAA" }

      it { should eq false }
    end
  end

  describe ".verify!" do
    subject { ChatworkWebhookVerify.verify!(token: token, body: body, signature: signature) }

    context "with valid signature" do
      it { expect { subject }.not_to raise_error }
    end

    context "with invalid signature" do
      let(:signature) { "AAAAAAAAA" }

      it { expect { subject }.to raise_error ChatworkWebhookVerify::InvalidSignatureError }
    end
  end

  describe ".generate_signature" do
    subject { ChatworkWebhookVerify.generate_signature(token: token, body: body) }

    it { should eq signature }
  end
end
