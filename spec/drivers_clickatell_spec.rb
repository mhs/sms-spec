require 'clickatell'
require 'twilio-ruby'
require File.join(File.dirname(__FILE__), *%w[spec_helper])

describe SmsSpec do
  include SmsSpec::Helpers

  before do
    # Got TEST NUMBER FROM: http://forums.clickatell.com/clickatell/
    #    topics/clickatell_sandbox_similar_to_paypal_sandbox
    @to_number   = '27999900001' # TEST NUMBER
    @from_number = '27999900005' # TEST NUMBER
    @api = Clickatell::API.authenticate(
      ENV["CLICKATELL_API_KEY"],
      ENV["CLICKATELL_LOGIN"],
      ENV["CLICKATELL_PASSWORD"]
    )
  end

  before :each do
    SmsSpec::Data.clear_messages
  end

  describe "the clickatell driver" do

    it "intercepts calls to clickatell's sms client" do
      expect { 
        @api.send_message(@to_number, 'Hello from clickatell')
      }.to raise_error("No Credit Left")
    end

    it "allows for sid method calls on the account object" do
      expect { 
        @api.send_message(@to_number, 'Hello from clickatell')
      }.to raise_error("No Credit Left")
    end

    it "records the 'from' number for a message" do
      additional_opts = { from: @from_number }
      expect { 
        @api.send_message(@to_number, 'Hello from clickatell', additional_opts)
      }.to raise_error("No Credit Left")
    end

  end
end

