# Setup dependencies
require_relative 'lib/board_class'

# Create board
game = Board.new
player = 'X'

while game.status != 'Complete'
  game.make_move(player)
  player = if player == 'X'
             'O'
           else
             'X'
           end
end
