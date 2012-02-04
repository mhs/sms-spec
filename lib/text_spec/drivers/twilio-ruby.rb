class Twilio::REST::Client

  def initialize(account_sid, auth_token)
  end

  class Messages
    include TextSpec::Helpers

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
  end

  def account
    return Account.new
  end
end
