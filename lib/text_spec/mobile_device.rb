class MobileDevice

  def initialize(number)
    @number = number
  end

  def messages
    TextSpec::Data.messages.select {|d| d.number == @number}
  end
end
