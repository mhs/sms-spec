require 'text_spec/util'

module TextSpec
  class Data
    extend TextSpec::Util

    def self.add_message message
      @@messages ||= []
      @@messages << message
    end

    def self.clear_messages
      @@messages = []
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
      message = @@messages.select {|m| m.number == phone_number}.first
      @@current_text_message = @@messages.delete(message)
    end

  end
end
