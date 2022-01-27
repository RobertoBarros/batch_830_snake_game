class Snake < Game


  def initialize(foods)
    super()
    @foods = foods
    @segments = []
    @segments << Square.new(x: 0, y: 0, size: @scale, color: 'white')

    @direction = 'right'

    @dead = false

    3.times { grow }
  end

  def draw
    return unless Window.frames % @speed == 0

    head = @segments.first
    head.color = 'blue'

    new_head = Square.new(x: head.x, y: head.y, size: @scale, color: 'white')

    case @direction
    when 'up'    then new_head.y -= @scale
    when 'down'  then new_head.y += @scale
    when 'left'  then new_head.x -= @scale
    when 'right' then new_head.x += @scale
    end

    @segments.unshift(new_head)
    @segments.pop.remove

    check_food
    check_dead
  end

  def change_direction(new_direction)
    return if (@direction == 'up'    && new_direction == 'down')  ||
              (@direction == 'down'  && new_direction == 'up')    ||
              (@direction == 'left'  && new_direction == 'right') ||
              (@direction == 'right' && new_direction == 'left')

    @direction = new_direction
  end

  def dead?
    @dead
  end

  private

  def check_food
    head = @segments.first

    @foods.each do |food|
      if head.x == food.x && head.y == food.y
        food.eat!
        3.times { grow }
        increase_speed
      end
    end
  end

  def check_dead
    head = @segments.first
    max_x = (@grid_x - 1) * @scale
    max_y = (@grid_y - 1) * @scale

    if head.x.negative? || head.x > max_x ||head.y.negative? || head.y > max_y
      @dead = true
      return
    end

    @segments.drop(1).each do |segment|
      if head.x == segment.x && head.y == segment.y
        @dead = true
        return
      end
    end
  end

  def grow
    tail = @segments.last
    new_segment = Square.new(x: tail.x, y: tail.y, size: @scale, color: 'blue')
    @segments << new_segment
  end

end
