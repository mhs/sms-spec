require 'twilio-ruby'
require File.join(File.dirname(__FILE__), *%w[spec_helper])

describe SmsSpec do
  include SmsSpec::Helpers

  before :each do
    SmsSpec::Data.clear_messages
  end

  describe "the twilio-ruby driver" do
    it "is assignable" do
      SmsSpec.driver = :"twilio-ruby"
    end

    it "intercepts calls to twilio's sms client" do
      account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
      auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.sms.messages.create(
        :from => '+14159341234',
        :to => '+16105557069',
        :body => 'Hey there!'
      )

      open_last_text_message_for("+16105557069")
      current_text_message.should_not be_nil
    end
  end
end
