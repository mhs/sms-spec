module SmsSpec
  class Message
    attr_accessor :number
    attr_accessor :body

    include SmsSpec::Util

    def initialize(opts={})
      @number = sanitize opts[:number]
      @body = opts[:body]
    end
  end
end
