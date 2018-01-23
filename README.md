# ChatworkWebhookVerify
Verify ChatWork webhook signature

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'chatwork_webhook_verify'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install chatwork_webhook_verify
```

## Basic usage
```ruby
ChatworkWebhookVerify.verify?(token: token, body: body, signature: signature)
#=> true | false
```

or 

```ruby
ChatworkWebhookVerify.verify!(token: token, body: body, signature: signature)
#=> raise ChatworkWebhookVerify::InvalidSignatureError if signature is invalid
```

* `token` : webhook token (default: `ChatworkWebhookVerify.config.token`)
* `body` : request body from webhook
* `signature` : `chatwork_webhook_signature` (query string) or `X-ChatWorkWebhookSignature` (request header)

## for Rails
include `ChatworkWebhookVerify::ControllerExtension` in controller and call `verify_chatwork_webhook_signature!`

e.g.

```ruby
class WebhookController < ApplicationController
  # `ChatworkWebhookVerify.config.token` is used
  before_action :verify_chatwork_webhook_signature!
end
```

or

```ruby
class WebhookController < ApplicationController
  before_action :verify_chatwork_webhook_signature_with_own_token!
  
  def verify_chatwork_webhook_signature_with_own_token!
    verify_chatwork_webhook_signature!("another_token")
  end
end
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
