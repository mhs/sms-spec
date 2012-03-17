require 'sms_spec/util'

module SmsSpec
  class Data
    extend SmsSpec::Util

    def self.add_message message
      @@messages ||= []
      @@messages << message
    end

    def self.clear_messages
      @@messages = []
      @@current_text_message = nil
    end

    def self.messages
      @@messages ||= []
    end

    def self.set_current_number(number)
      @@current_number = sanitize number
    end

    def self.current_number
      @@current_number
    end

    def self.current_text_message
      @@current_text_message ||= nil
    end

    def self.open_last_text_message_for(phone_number)
      message = messages_for(phone_number).first
      @@current_text_message = @@messages.delete(message)
    end

    def self.messages_for(phone_number)
      @@messages.select {|m| m.number == sanitize(phone_number)}
    end

  end
end
