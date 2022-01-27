require 'ruby2d'
require_relative 'game'
require_relative 'board'
require_relative 'snake'
require_relative 'keyboard'
require_relative 'food'


board = Board.new
board.draw

snake = Snake.new(board.foods)

Keyboard.new(snake)

update do
  if snake.dead?
    Text.new('Game Over', size: 80, x: 180, y: 150, color: 'red')
  else
    snake.draw
  end
end




show
