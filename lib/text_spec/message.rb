class Message
  attr_accessor :number
  attr_accessor :body

  def initialize(opts={})
    @number = opts[:number]
    @body = opts[:body]
  end
end
