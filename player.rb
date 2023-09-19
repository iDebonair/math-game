class Player
    attr_accessor :name, :lives

    # Initialize player with a name and 3 lives
    def initialize(name)
        @name = name
        @lives = 3
    end

    #if players gets the question wrong, decrease lives by 1
    def lose_life
        @lives -= 1
    end

    # Checks if player has lives left
    def game_over
        @lives == 0
    end
end
