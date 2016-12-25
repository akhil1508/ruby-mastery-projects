DICTIONARY = File.open('dictionary.txt', 'r').readlines
def generate_eligible_words_array()
    eligible_words = DICTIONARY.select do |word|
        word = word.split(' ').join('')
        word.length >= 5 && word.length <= 12
    end
    eligible_words
end

def play()
    already_entered = []
    random_word_array = generate_random_word_array(generate_eligible_words_array)
    chances = random_word_array.length * 2
    current_state = []
    length = random_word_array.length
    length.times do
        current_state.push('_')
    end
    while chances > 0

        puts "Guesses left: #{chances}"
        puts current_state.join(' ')
        puts
        puts 'Enter letter:'
        letter = gets.chomp.downcase
        if letter.length > 1
            puts 'Enter a single letter and a single letter only:'
            letter = gets.chomp.downcase
        end
        checked = check(already_entered, letter)
        if checked
          already_entered = checked
        else
          while !check(already_entered, letter)
            puts"Enter a letter you haven't entered before"
            letter = gets.chomp.downcase
          end
        end

        random_word_array.each_with_index do |current_letter, index_of_current_letter|
          current_letter = current_letter.downcase
            if current_letter.casecmp(letter).zero?
                current_state[index_of_current_letter] = letter
            end
        end
        unless current_state.join('').match('_')
            puts "Well done. You've won. Wanna play again?"
            if gets.chomp.upcase == 'Y'
              play
            else
              exit
            end
        end
        chances -= 1
        if chances == 0
          puts answer(random_word_array)
          puts "You've lost. Wanna play again(Y/N)?"
          if gets.chomp.upcase == 'Y'
            play
          else
            exit
          end
        end
    end
end

def answer(random_word_array)
  random_word_array.join('')
end
def generate_random_word_array(eligible_words)
    length = eligible_words.length
    random_number = rand(0..length)
    array = eligible_words[random_number].split('')
    2.times { array.pop }
    array
 end

 def check already_entered, letter
   if !already_entered.include? letter
       already_entered << letter
       return already_entered
     else
       return false
     end
 end
play
