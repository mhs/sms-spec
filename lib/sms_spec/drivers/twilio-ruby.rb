class Twilio::REST::Client

  def initialize(account_sid, auth_token)
    $account_sid = account_sid
  end

  class Messages
    include SmsSpec::Helpers

    def create(opts={})
      to = opts[:to]
      body = opts[:body]
      add_message Message.new(:number => to, :body => body)
    end
  end

  class Sms
    def messages
      return Messages.new
    end
  end

  class Account
    def sms
      return Sms.new
    end
    ##
    # Supports Client call
    # @client.account.available_phone_numbers.get('US').local.list({:area_code => '517',})
    # See https://www.twilio.com/user/account/developer-tools/api-explorer/available-local
    ##
    def available_phone_numbers
      return PhoneNumbers.new
    end

    ##
    # Supports Client call
    # @client.account.incoming_phone_numbers.create({:phone_number => '+15172345677'})
    # See https://www.twilio.com/user/account/developer-tools/api-explorer/incoming-create
    ##
    def incoming_phone_numbers
      return PhoneNumbers.new
    end
  end

  class PhoneNumbers
    
    def get(country)
     return  CountryNumbers.new   
    end
    
    def create(number)
     
       friendly_number ="(%s) %s-%s" %[number[2..4], number[5..7], number[8..11]]

       return   Number.new({
                "sid"=> "QR3d631fb8a0bd7c35e1cc6912bf0622b1",
                "account_sid"=> "#{$account_sid}",
                "friendly_name"=> "#{friendly_number}",
                "phone_number"=>"#{number}",
                "voice_url"=> "",
                "voice_method"=> "POST",
                "voice_fallback_url"=> "",
                "voice_fallback_method"=> "POST",
                "voice_caller_id_lookup"=> false,
                "date_created"=> "Sun, 09 Feb 2014 07:27:56 +0000",
                "date_updated"=> "Sun, 09 Feb 2014 07:27:56 +0000",
                "sms_url"=> "",
                "sms_method"=> "POST",
                "sms_fallback_url"=> "",
                "sms_fallback_method"=> "POST",
                "capabilities"=> {
                    "voice"=> true,
                    "sms"=> true,
                    "mms"=> false
                  }
                })
      end
  end

  class CountryNumbers
    def local
      return LocalNumbers.new 
    end
  end

  class LocalNumbers
    def list(opt={})
      area_code = opt[:area_code]
     if area_code.nil? ||  area_code.size != 3 
       return []
     else
        return [
                Number.new({
                  "friendly_name"=> "(#{area_code}) 386-1937",
                  "phone_number"=>"+1#{area_code}3861937",
                  "lata"=>"346",
                  "rate_center"=>"EATON RPD",
                  "latitude"=>"42.510300",
                  "longitude"=>"-84.663700",
                  "region"=>"MI",
                  "postal_code"=>"48827",
                  "iso_country"=>"US",
                  "capabilities"=>{
                    "voice"=>true,
                    "SMS"=>true,
                    "MMS"=>false
                  }
                }),
                Number.new({
                  "friendly_name"=>"(#{area_code}) 939-0501",
                  "phone_number"=>"+#{area_code}9390501",
                  "lata"=>"348",
                  "rate_center"=>"QUINCY",
                  "latitude"=>"41.949100",
                  "longitude"=>"-84.881600",
                  "region"=>"MI",
                  "postal_code"=>"49082",
                  "iso_country"=>"US",
                  "capabilities"=>{
                    "voice"=>true,
                    "SMS"=>true,
                    "MMS"=>false
                  }
                }) ]
      end
    end
  end

  class Number
      attr_accessor :friendly_name, :phone_number, :capabilities
      def initialize(params)
          @friendly_name=params["friendly_name"]
          @phone_number=params["phone_number"]
          @capabilities=Capabilities.new(params["capabilities"])
      end
  end

  class Capabilities

    attr_accessor :voice,:SMS,:MMS

    def initialize(params)
      @voice=params["voice"]
      @SMS = params["SMS"]
      @MMS = params["MMS"]
    end

  end

  def account
    account = Account.new
    account.class.send(:define_method, :sid, lambda { $account_sid })
    account
  end
end
