class NumberConversion
  attr_accessor :phone_number

  def initialize(number)
    @phone_number = number
  end

  def call
    # Converting no to array
    ph_no_array = phone_number.to_s.split('')

    # Validations
    # 1. Length Check
    return "Length should be equal to 10" if ph_no_array.length != 10
    # 2. 0 or 1 Presence check
    return "Should not contain 1 or 0" if ph_no_array.select { |a| a == '1' or a == '0' }.length > 0
  end
end
