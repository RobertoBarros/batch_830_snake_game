class Food < Game
  attr_reader :x, :y

  def initialize
    super
    @x = rand(@grid_x + 1) * @scale
    @y = rand(@grid_y + 1) * @scale
  end

  def eat!
    @food.remove
  end

  def draw
    @food = Circle.new(x: @x + (@scale /2), y: @y + (@scale /2), radius: @scale * 0.2, color: 'red')
  end

end
