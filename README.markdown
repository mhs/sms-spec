# Text Spec

An RSpec DSL and Cucumber steps to test SMS interactions with your
Ruby on Rails application.

Currently this gem only supports testing SMS messageing using the
[twilio-ruby](https://github.com/twilio/twilio-ruby) gem.

##Setup
Add the text\_spec gem to your Gemfile:
<pre>
group :test do
  gem 'text_spec'
end
</pre>

## RSpec
In your spec\_helper.rb file add the following:
<pre>
require 'text_spec'
</pre>

If you want to have the helpers available in all of your example groups,
you can add the following to your spec_helper.rb:
<pre>
Spec::Runner.configure do |config|
  config.include(TextSpec::Helpers)
  config.include(TextSpec::Matchers)
end
</pre>

Otherwise you will have to incliude the helpers and matchers in any
example where you use them:

<pre>
describe "MyController" do
  include TextSpec::Helpers
  include TextSpec::Matchers
end
</pre>

## Cucumber
Add the folloing to you env.rb file:

<pre>
require 'text_spec'
require 'text_spec/cucumber'
</pre>

This loads the text\_spec RSpec helpers into your cucumber wold. Then,
run the following to generate the text\_messsage\_steps.rb file:

<pre>
rails generate text_spec:steps
</pre>
