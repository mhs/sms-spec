class Message
  attr_accessor :number
  attr_accessor :body

  include TextSpec::Util

  def initialize(opts={})
    @number = sanitize opts[:number]
    @body = opts[:body]
  end
end
