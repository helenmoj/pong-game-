require 'gosu'
include Gosu

#require_relative '../../features/step_definitions/sd_challenging_dom.rb'

require_relative '../..//Helen Rubymine project/pong_ruby/player.rb'
require_relative '../..//Helen Rubymine project/pong_ruby/ball.rb'
require_relative '../..//Helen Rubymine project/pong_ruby/scoreboard.rb'

class GamePong < Gosu::Window # each time you write a game start by creating a subclass of Gosu::Window

  # Constants
  #HEIGHT  = 400
  # WIDTH = 800
  def initialize(width=800, height=600, fullscreen=false)
    #def initialize(WIDTH, HEIGHT)
    @ball = Ball.new(self, width, height)
    @state = :stopped
   @player_1 = Player.new(self, 40, height/2, 'player 1')
    @player_2 = Player.new(self,width - 40, height/2, 'player 2')
    @players = [@player_1, @player_2]
    @winner = nil
    @score_board = Scoreboard.new(self, width)
    @background_image = Gosu::Image.new("/home/helen/Desktop/Helen Rubymine project/pong_ruby/images/space.png", :tileable => true)
    super
  end

  def update
   if @state == :in_play
     if button_down?(kbDown) # (kbW)
         @player_1.move_up
     end
     if button_down?(kbs)
       @player_1.move_down
     end
     if button_down?(kbk)
       @player_2.move_down
     end
     if button_down?(kbI)
       @player_2.move_up
     end
     if @player_1.hit_ball(@ball)
       @ball.hit_stick(@player_1.y - @ball.y)
     end
     if @player_2.hit_ball(@ball)
       @ball.hit_stick(@player_2.y - @ball.y)
     end
     if @ball.x <0
       @player_2.score
       @players.each(&:reset)
       @ball.reset
       @state = :stopped
     end
     if @ball.> width
       @player_1.score
       @players.each(&:reset)
       @ball.reset
       @state = :stopped
     end
     if @player_1.score == 10
       @winner = @player_1
       @state = :ended
     elsif
       if @player_2.score == 10
         @winner = @player_2
         @state = :ended
       end
       @ball.update
     elsif @state == :stopped
       if button_down?(kbSpace)
         @state = :in_play
       end
     end
   end

    def draw
      
    end
  end
end

GamePong.new.show
