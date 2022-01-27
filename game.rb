class Game

  def initialize
    @speed = 5
    @scale = 20
    @grid_x = 40
    @grid_y = 25
  end

  def increase_speed
    @speed -= 1 if @speed >= 2
  end
end
