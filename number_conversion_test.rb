require "test/unit"
require_relative "number_conversion"
class NumberConversionTest < Test::Unit::TestCase
  def test_length_check
    assert_equal('Length should be equal to 10', NumberConversion.new(123).call)
  end

  def test_number_check
    assert_equal('Should not contain 1 or 0', NumberConversion.new(2314567890).call)
  end

  def test_words_check
    final_words = NumberConversion.new(2282668687).call
    assert final_words.include?("cat, boot, our")
    assert final_words.include?("catamounts")
    assert final_words.include?("act, amounts")
    assert_equal final_words.include?("acts, amount"), false

    final_words = NumberConversion.new(6686787825).call
    assert final_words.include?("motortruck")
    assert final_words.include?("motor, truck")
    assert final_words.include?("not, opt, puck")
    assert_equal final_words.include?("nots, opt, puc"), false
  end
end
