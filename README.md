# phone_number_conversion
This will convert phone no to words which user can easily remember using dictionary

# How to Run
ruby -r "./number_conversion.rb" -e "NumberConversion.new(2282668687).call"

# Results
If the number's length is not equal to 10 then it'll return length should be 10
For ex: ruby -r "./number_conversion.rb" -e "NumberConversion.new(23456).call"

If the number's length contains 0 or 1 then it'll return no should not contain 0 or 1
For ex: ruby -r "./number_conversion.rb" -e "NumberConversion.new(1010101010).call"

If the no is valid then it'll return all possible words.
For No: 2282668687

Results will contain some possibilites like:
acta, mot, mus
acta, mot, nus
acta, mot, our
acta, not, mus
acta, not, nus
acta, not, our
acta, oot, mus
acta, oot, nus
acta, oot, our
catamounts

# Thought Process
1. First converted given no to string and converted each no to specific letters.
2. Organizing dictionary by length of the words. So that checking against will save the execution time.
3. Now taking all possibilies of combinations like if the no is 2282668687
   then [[228,2668687], [2282,668687], [22826,68687], [228266,8687], [2282668,687]]
   [228,266,8687], [228,2668,687], [2282,668,687].
4. After that using Ruby's product method getting all unique possible words and checking against dictionary.

