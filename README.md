# ChatworkWebhookVerify
Verify ChatWork webhook signature

[![Gem Version](https://badge.fury.io/rb/chatwork_webhook_verify.svg)](https://badge.fury.io/rb/chatwork_webhook_verify)
[![test](https://github.com/sue445/chatwork_webhook_verify/actions/workflows/test.yml/badge.svg)](https://github.com/sue445/chatwork_webhook_verify/actions/workflows/test.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/d7ea5e910c29987c7c0e/maintainability)](https://codeclimate.com/github/sue445/chatwork_webhook_verify/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/sue445/chatwork_webhook_verify/badge.svg?branch=master)](https://coveralls.io/github/sue445/chatwork_webhook_verify?branch=master)

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
  * Either `token` or `ChatworkWebhookVerify.config.token` is required
* `body` : request body from webhook
* `signature` : `chatwork_webhook_signature` (query string) or `X-ChatWorkWebhookSignature` (request header)

## for Rails
call `verify_chatwork_webhook_signature!` in your controller

### Example 1
```ruby
# config/initializers/chatwork_webhook_verify.rb
ChatworkWebhookVerify.config.token = ENV["CHATWORK_WEBHOOK_TOKEN"]
```

```ruby
# app/controllers/webhook_controller.rb
class WebhookController < ApplicationController
  # `ChatworkWebhookVerify.config.token` is used
  before_action :verify_chatwork_webhook_signature!
end
```

### Example 2
```ruby
# app/controllers/webhook_controller.rb
class WebhookController < ApplicationController
  before_action :verify_chatwork_webhook_signature_with_own_token!
  
  def verify_chatwork_webhook_signature_with_own_token!
    verify_chatwork_webhook_signature!("another_token")
  end
end
```

## for Sinatra
```ruby
# app.rb
class App < Sinatra::Base
  before "/webhook" do
    token     = ENV["CHATWORK_WEBHOOK_TOKEN"]
    body      = request.body.read
    signature = request.env["HTTP_X_CHATWORKWEBHOOKSIGNATURE"]

    ChatworkWebhookVerify.verify!(token: token, body: body, signature: signature)
  end

  post "/webhook" do
    "ok"
  end
end
```

## Configuration
```ruby
ChatworkWebhookVerify.config.token = ENV["CHATWORK_WEBHOOK_TOKEN"]
```

* `token` : default webhook token

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
