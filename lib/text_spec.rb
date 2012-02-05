require 'rspec'
require "text_spec/version"
require "text_spec/helpers"
require "text_spec/data"
require "text_spec/message"
require "text_spec/util"
require "text_spec/mobile_device"
require "text_spec/matchers"
#require "text_spec/drivers/twilio-ruby"

module TextSpec
  def self.driver=(driver_sym)
    require "text_spec/drivers/#{driver_sym.to_s}"
  end

  TextSpec.driver = :"twilio-ruby"
end
  
