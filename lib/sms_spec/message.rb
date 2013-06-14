module SmsSpec
  class Message
    attr_accessor :number
    attr_accessor :body
    attr_accessor :from

    include SmsSpec::Util

    def initialize(opts={})
      @number = sanitize opts[:number]
      @body = opts[:body]
      @from = opts[:from]
    end
  end
end