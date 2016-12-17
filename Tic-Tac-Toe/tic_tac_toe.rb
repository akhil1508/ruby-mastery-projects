class Game
    attr_accessor :game_array, :number_of_turns

    def initialize
        @game_array = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        @number_of_turns = 0
        puts "**This game is a classic commandline version of Tic-Tac-Toe. It matches human players against each other. You have to input coordinates of your X's or O's in the format \"R,C\"(without the quotes) where R and C represent two integers greater than 0 and less than 4. Remember, always enter row to the right and column to the left. The game randomly selects either player1 or player2 for the first turn. Have fun. Or not.**"
        display
    end

    def play
        number_of_turns = 0
        this_turn = toss + 1
        holder = this_turn
        x_or_o = 'X'

        while win_check || draw_check
            x_or_o = if this_turn == holder
                         'X'
                     else
                         'O'
                     end
            puts "Player #{this_turn}, it is your turn. Enter coordinates(separated by commas)."
            entry = gets.chomp
            if entry_check(entry)
                enter(entry, x_or_o)
            else
                while entry_check(entry) == false
                    puts "Player #{this_turn}, please enter correct coordinates and in a spot that contains zero."
                    entry = gets.chomp
                end
                enter(entry, x_or_o)
            end
            this_turn = if this_turn == 2
                            1
                        else
                            2
                        end

            display
            number_of_turns += 1

        end
        puts 'Game drawn' if draw_check
        puts "Game won by Player #{number_of_turns % holder + 1} in #{number_of_turns}"
    end

    def toss
        rand(0..1)
    end

    def display
        puts '    C1  C2  C3'
        game_array.each_with_index do |i, index|
            print "R#{index + 1}"
            i.each do |j|
                print "  #{j} "
            end
            puts
        end
    end

    def entry_check(coord)
        coord_array = coord.split(',')
        return false if coord_array.find nil
        2.times do |i|
            return false if coord_array[i] > 3 || coord_array[i] < 1
        end
        puts coord_array
        coord_array[0] = coord_array[0].to_i - 1
        coord_array[1] = coord_array[1].to_i - 1
        if game_array[coord_array[0]][coord_array[1]] == 0
            return true
        else
            return false
      end
  end

    def enter(coord, x_or_o)
        coord_array = coord.split(',')
        coord_array[0] = coord_array[0].to_i - 1
        coord_array[1] = coord_array[1].to_i - 1
        game_array[coord_array[0]][coord_array[1]] = x_or_o
    end

    def win_check
        if row_check || column_check || diagonal_1_check || diagonal_2_check
            false
        else
            true
        end
      end

    def row_check
        3.times do |i|
            return true if game_array[i].join('').match('XXX|OOO')
        end
        false
    end

    def diagonal_1_check
        new = ''
        game_array.each_with_index do |i, index_of_i|
            i.each_with_index do |j, index_of_j|
                new += j.to_s if index_of_j == index_of_i
            end
        end
        return true if new.match('XXX|OOO')
        false
    end

    def diagonal_2_check
        new = ''

        game_array.each_with_index do |i, index_of_i|
            i.each_with_index do |j, index_of_j|
                new += j.to_s if index_of_j + index_of_i == 2
            end
        end
        return true if new.match('XXX|OOO')
        false
    end

    def column_check
        new = ''
        3.times do |i|
            3.times do |j|
                new += game_array[j][i].to_s
                return true if new.match('XXX|OOO')
            end
        end
        false
    end

    def draw_check
        counter = 0
        game_array.each_with_index do |i|
            i.each_with_index do |j|
                counter += 1 if j == 0
            end
        end
        if counter == 0
            return false
        else
            return true
    end
end

game = Game.new

game.play
end
