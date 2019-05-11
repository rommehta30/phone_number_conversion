class NumberConversion
  attr_accessor :phone_number

  def initialize(number)
    @phone_number = number
  end

  def call
    print phone_number
  end
end
