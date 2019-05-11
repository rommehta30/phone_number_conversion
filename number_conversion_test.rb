require "test/unit"
require_relative "number_conversion"
class NumberConversionTest < Test::Unit::TestCase
  def test_length_check
    assert_equal('Length should be equal to 10', NumberConversion.new(123).call)
  end

  def test_number_check
    assert_equal('Should not contain 1 or 0', NumberConversion.new(2314567890).call)
  end
end
