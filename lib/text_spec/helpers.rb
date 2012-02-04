require 'forwardable'

module TextSpec
  module Helpers
    extend Forwardable
    
    def_delegators :"TextSpec::Data", 
      :messages,
      :add_message,
      :set_current_number,
      :current_number,
      :clear_messages,
      :current_text_message,
      :open_last_text_message_for
  end
end
