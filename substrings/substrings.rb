#!/usr/bin/ruby
def substrings (word, dictionary)
  valid_substrings = {}
  words= word.split(" ")
  puts dictionary.inspect
  puts words.inspect
 words.each do |current_word|

   dictionary.each do |current_dictionary_word|

     valid_substrings[current_dictionary_word] = 0
       if current_word.match(/[current_dictionary_word]/)

         valid_substrings[current_dictionary_word]+=1

       end



 end

end
return valid_substrings
end
dictionary = []
puts"Enter word"
word = gets.chomp
puts"Enter dictionary(comma separated values)"
dictionary=gets.chomp.split(",")
valid_substrings = substrings(word, dictionary)
puts valid_substrings
