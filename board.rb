class Board < Game
  attr_reader :foods

  def initialize
    super
    @foods = []

    10.times { @foods << Food.new }
  end


  def draw
    Window.set title: 'Snake Game',
                background: 'teal',
                width: @grid_x * @scale,
                height:@grid_y * @scale

    @foods.each { |food| food.draw }
  end
end
