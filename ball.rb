class Ball

  attr_accessor :x, :y

  def initialize(window,x, y)
    @window = window
    @init_y = y/2
    @init_x = x/2
    reset
    @y = 0
    @x = 4
  end

  def update
    @x += @x
    @y += @y
    if @y > 400 || @y < 0
      @y = -1
    end
    end

  def draw
    @window.draw_quad(
        #@x -4, @y -4, color::WHITE,
        @x -4, @y -4, Gosu::Color::WHITE,
        #@x -4, @y +4, color::WHITE,
        @x -4, @y +4, Gosu::Color::WHITE,
        #@x +4, @y -4, color::WHITE,
        @x +4, @y -4, Gosu::Color::WHITE,
      #  @x +4, @y +4, color::WHITE,
        @x +4, @y +4, Gosu::Color::WHITE,
        )

  end

  def hit_stick(connecting_point)
    @x = -1
    @y += connecting_point / 10
  end

  def reset
    @x = @init_x
    @y = @init_y
    @x = 4
    @y = 0
  end
  end

