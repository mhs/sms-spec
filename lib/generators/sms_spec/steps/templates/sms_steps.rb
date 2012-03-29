# -------------------------------------------
# Available methods
# -------------------------------------------

# messages
# add_message
# set_current_number
# current_number
# clear_messages
# current_text_message
# open_last_text_message_for


Given /^no text messages have been sent$/ do
  clear_messages
end

Given /^all text messages have been read$/ do
  clear_messages
end

Then /^"([^"]*)" should receive a text message$/ do |phone_number|
  messages_for(phone_number).should_not be_empty
end

Then /^"([^"]*)" should receive no text messages$/ do |phone_number|
  messages_for(phone_number).should be_empty
end

When /^"([^"]*?)" opens? the text message$/ do |mobile_number|
  open_last_text_message_for(mobile_number)
end

Then /^I should see "([^"]*)" in the text message body$/ do |content|
  current_text_message.should have_body(content)
end

Then /^I should see the following in the text message body:$/ do |content|
  current_text_message.should have_body(content)
end
