dictionary = File.open('dictionary.txt', 'r').readlines
def generate_eligible_words_array(dictionary)
    eligible_words = dictionary.select do |word|
        word = word.split(' ').join('')
        word.length >= 5 && word.length <= 12
    end
    eligible_words
end

def play(dictionary)
    already_entered = []
    random_word_array = generate_random_word_array(generate_eligible_words_array(dictionary))
    chances = random_word_array.length
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
        letter = gets.chomp
        if letter.length > 1
            puts 'Enter a single letter and a single letter only:'
            letter = gets.chomp
        end
        if !already_entered.include? letter
            already_entered.push(letter)
        else
            puts"Enter a letter you haven't entered before"
            letter = gets.chomp
        end

        random_word_array.each_with_index do |current_letter, index_of_current_letter|
            if current_letter.casecmp(letter.downcase).zero?
                current_state[index_of_current_letter] = letter
            end
        end
        unless current_state.join('').match('_')
            puts "Well done. You've won. Wanna play again?"
            exit
        end
        chances -= 1
    end
end

def generate_random_word_array(eligible_words)
    length = eligible_words.length
    random_number = rand(0..length)
    array = eligible_words[random_number].split('')
    2.times { array.pop }
    array
 end
puts 'Ready to play (Y/N)'
if gets.chomp.casecmp('Y').zero?
    play(dictionary)
else
    exit
end
puts 'You\'ve lost. Wanna play again?(Y/N)'
if gets.chomp.casecmp('Y').zero?
    play(dictionary)
else
    exit
end
