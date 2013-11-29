# SMS Spec

An RSpec DSL and Cucumber steps to test SMS interactions with your
Ruby on Rails application.

Currently this gem only supports testing SMS messageing using the
[twilio-ruby](https://github.com/twilio/twilio-ruby) and
[lookout-clickatell](https://github.com/lookout/clickatell) gem.

##Setup
Add the sms-spec gem to your Gemfile:
<pre>
group :test do
  gem 'sms-spec'
end
</pre>

## RSpec
In your spec\_helper.rb file add the following:
<pre>
require 'sms_spec'
</pre>

If you want to have the helpers available in all of your example groups,
you can add the following to your spec_helper.rb:
<pre>
Spec::Runner.configure do |config|
  config.include(SmsSpec::Helpers)
  config.include(SmsSpec::Matchers)
end
</pre>

Otherwise you will have to incliude the helpers and matchers in any
example where you use them:

<pre>
describe "MyController" do
  include SmsSpec::Helpers
  include SmsSpec::Matchers
end
</pre>

## Cucumber
Add the folloing to you env.rb file:

<pre>
require 'sms_spec'
require 'sms_spec/cucumber'
</pre>

This loads the sms\_spec RSpec helpers into your cucumber wold. Then,
run the following to generate the text\_messsage\_steps.rb file:

<pre>
rails generate sms_spec:steps
</pre>
