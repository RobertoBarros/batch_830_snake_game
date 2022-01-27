class Keyboard
  def initialize(snake)
    Window.on :key_down do |event|

      snake.change_direction(event.key)
    end
  end
end
