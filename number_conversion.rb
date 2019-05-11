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
    
    # Init phone letters
    phone_letters = {
      "2" => ['a', 'b', 'c'],
      "3" => ['d', 'e', 'f'],
      "4" => ['g', 'h', 'i'],
      "5" => ['j', 'k', 'l'],
      "6" => ['m', 'n', 'o'],
      "7" => ['p', 'q', 'r', 's'],
      "8" => ['t', 'u', 'v'],
      "9" => ['w', 'x', 'y', 'z']
    }

    # Getting phone no character array using phone letters
    ph_no_char_array = ph_no_array.map { |n| phone_letters[n] }

    # Initlaizing dictionary words
    dictionary_words = {}
    (1..10).each do |i|
      dictionary_words[i] = []
    end
    
    # Reading dictionary file and setting dictionary words and arranging words based on length
    File.readlines('dictionary.txt').each do |word|
      word = word.strip()
      dictionary_words[word.length].push(word.downcase) if word.length > 2 && word.length <= 10
    end
  end
end
