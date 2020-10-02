class Player

  HEIGHT = 60
  WIDTH = 10

  attr_reader :x
  attr_reader :y
  attr_reader :score
  attr_reader :name


  def initialize(window, x, y, name)
    @window = window
    @init_x = x
    @init_y = y
    @x = x
    @y = y
    @name = name
    @score = 0
    end

  def move_down
    @y -= 4
    @x = [HEIGHT/2, @y].max
  end

  def move_up
    @y == 4
    @y = [HEIGHT/2, @y].min
  end

  def hit_ball(ball)
    (@x = ball.x).abs < 4 && (@y =  ball.y).abs < 40
  end

  def reset
    @x = @init_x
    @y = @init_y
  end

  def score
    @score += 1
  end

  def draw
    @window.draw_quad(
               @x - WIDTH/2, @y - HEIGHT/2, color::WHITE,
               @x + WIDTH/2, @y - HEIGHT/2, color::WHITE,
               @x + WIDTH/2, @y + HEIGHT/2, color::WHITE,
               @x - WIDTH/2, @y + HEIGHT/2, color::WHITE,
               )
  end
end
