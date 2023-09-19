require_relative 'player'

class GameLogic
    def initialize(player1, player2)
        @players = [Player.new(player1), Player.new(player2)]
        @current_player_index = 0
    end

    # Switch the current player
    def change_player
        @current_player_index = (@current_player_index + 1) % @players.length
    end

    # Generates a random math question
    def load_question
        num1 = rand(1..20)
        num2 = rand(1..20)
        operator = ["+", "-", "*", "/"].sample

        "#{num1} #{operator} #{num2}"
    end

    # Ask the current player a math question and checks the answer
    def ask_question
        question = load_question
        print "#{current_player.name}, what is #{question} ? "
        answer = gets.chomp.to_i

        eval(question) == answer
    end

    def current_player
        @players[@current_player_index]
    end

    # Check if any player has no lives left
    def game_over?
        @players.any? { |player| player.game_over }
    end

    # Run the game loop until one player wins
    def play
        until game_over?
            if ask_question
                puts "YES! You are Correct. #{current_player.name} still has #{current_player.lives} lives left."
            else
                current_player.lose_life
                puts "Seriously?, No!. #{current_player.name} loses a life. #{current_player.name} has #{current_player.lives} lives left."
            end
            change_player
        end

        winner = @players.find { |player| !player.game_over }
        puts "#{winner.name} wins with #{winner.lives} lives remaining!"
    end
end


