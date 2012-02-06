# Text Spec

An RSpec DSL and Cucumber steps to test

##Setup
###Gem Setup
<code>
group :test do
  gem 'test_spec'
end
</code>


### Cucumber

Add the folloing to you env.rb file:

<code>
require 'email_spec'
require 'email_spec/cucubmber'
</code>

This loads the text_spec RSpec helpers into your cucumber wold. Then,
run the following:

<code>
rails generate text_spec:steps
</code>

