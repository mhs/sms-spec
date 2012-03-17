module SmsSpec
  module Matchers

    RSpec::Matchers.define :have_text_messages do
      match do |mobile_device|
        mobile_device.messages.count > 0
      end

      failure_message_for_should do |mobile_device|
        "expected the mobile device '#{mobile_device.number}' to have text messages but it did not"
      end

      failure_message_for_should_not do |mobile_device|
        "expected the mobile device '#{mobile_device.number}' to have no text messages but it did"
      end
    end

    RSpec::Matchers.define :have_body do |expected_body|
      match do |message|
        message.body == expected_body
      end

      #failure_message_for_should do |mobile_device|
        #"expected the mobile device '#{mobile_device.number}' to have text messages but it did not"
      #end

      #failure_message_for_should_not do |mobile_device|
        #"expected the mobile device '#{mobile_device.number}' to have no text messages but it did"
      #end
    end

  end
end
