class NumberConversion
  attr_accessor :phone_number

  MAX=10
  MIN=3

  def initialize(number)
    @phone_number = number
  end

  def call
    # Converting no to array
    ph_no_array = phone_number.to_s.split('')

    # Validations
    # 1. Length Check
    return "Length should be equal to 10" if ph_no_array.length != MAX
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
      dictionary_words[word.length].push(word.downcase) if word.length >= MIN && word.length <= MAX
    end

    # Getting Combinations
    combinations = get_combinations(ph_no_char_array)
  end

  private 

  # Return all possible combinations of min 3 length and returning all possibilites
  def get_combinations(ph_no_char_array)
    start = (MIN - 1)
    combinations = []
    (start..(ph_no_char_array.length - 1)).each do |i|
      first_word = ph_no_char_array[0..i]
      second_word = ph_no_char_array[(i + 1)..(ph_no_char_array.length - 1)]
      combinations << [first_word] if first_word.length == MAX
      combinations << [first_word, second_word] if first_word.length >= MIN  && second_word.length >= MIN
      # Checking if second part's length is more then 6
      if second_word.length >= (MIN * 2)
        ((i + MIN)..(ph_no_char_array.length - 1)).each do |j|
          second_word = ph_no_char_array[(i+1)..j]
          third_word = ph_no_char_array[(j+1)..(ph_no_char_array.length - 1)]
          combinations << [first_word, second_word, third_word] if first_word.length >= MIN && second_word.length >= MIN && third_word.length >= MIN
        end
      end
    end
    combinations
  end
end
