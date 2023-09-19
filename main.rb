require_relative 'player'
require_relative 'game_logic'

# Start the game with two player names
game = GameLogic.new("Player 1", "Player 2")
game.play
