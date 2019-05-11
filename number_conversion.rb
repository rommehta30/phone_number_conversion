class NumberConversion
  attr_accessor :phone_number

  MAX=10
  MIN=3

  def initialize(number)
    @phone_number = number
  end

  def call
    start_time = Time.now
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

    # Getting words
    final_words = get_combination_words(combinations, dictionary_words)
    final_words = final_words.compact.flatten
    final_words.map { |word| print "#{word}\n"}
    print "\n"
    finish_time = Time.now
    print (finish_time - start_time)*1000.00
    return final_words
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

  # Return all possible words by checking into dictionary
  def get_combination_words(combinations, dictionary_words)
    final_words = []
    combinations.each_with_index do |combination, index|
      results = []
      combination.each_with_index do |c, index_1|
        char_array = c.dup
        results[index_1] = char_array.shift.product(*char_array).uniq.map(&:join)
      end
      f_results = []
      results.each_with_index do |result, index_1|
        f_results[index_1] = (result & dictionary_words[result[0].length])
      end
      product = f_results.shift.product(*f_results).map { |r| r.join(', ')}
      final_words[index] = product if product.length > 0
    end
    final_words
  end
end
