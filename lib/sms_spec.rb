require 'rspec'
require "sms_spec/version"
require "sms_spec/helpers"
require "sms_spec/data"
require "sms_spec/message"
require "sms_spec/util"
require "sms_spec/mobile_device"
require "sms_spec/matchers"
#require "sms_spec/drivers/twilio-ruby"

module SmsSpec
  def self.driver=(driver_sym)
    require "sms_spec/drivers/#{driver_sym.to_s}"
  end

  SmsSpec.driver = :"twilio-ruby"
end
