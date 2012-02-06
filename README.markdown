# Text Spec

An RSpec DSL and Cucumber steps to test

##Setup
###Gem Setup
<pre>
group :test do
  gem 'test_spec'
end
</pre>


### Cucumber

Add the folloing to you env.rb file:

<pre>
require 'email_spec'
require 'email_spec/cucubmber'
</pre>

This loads the text_spec RSpec helpers into your cucumber wold. Then,
run the following:

<pre>
rails generate text_spec:steps
</pre>

