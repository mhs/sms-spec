require 'forwardable'

module SmsSpec
  module Helpers
    extend Forwardable
    
    def_delegators :"SmsSpec::Data", 
      :messages,
      :add_message,
      :set_current_number,
      :current_number,
      :clear_messages,
      :current_text_message,
      :messages_for,
      :open_last_text_message_for

    def twiml_message(from,to,body,asid)
      base_options = {
        "MessageSid"=>rand.to_s[2..34].to_s.rjust(34,'0'),
        "AccountSid"=>asid,
        "From"=> from,
        "To"=>to,
        "Body"=> body,
        "NumMedia"=> 0,
        "ToCity"=>"NOVATO",
        "ToZip"=>"94949",
        "ToState"=>"CA",
        "ToCountry"=>"US",
        "FromCity"=>"GRAND RAPIDS",
        "FromState"=>"MI",
        "FromZip"=>"49501",
        "FromCountry"=>"US"
        }
    end
  end
end
