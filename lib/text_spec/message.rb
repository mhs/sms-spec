class Message
  attr_accessor :number

  def initialize(opts={})
    @number = opts[:number]
    @body = opts[:body]
  end
end
