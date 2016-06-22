require 'gosu'
require_relative 'background'
require_relative 'hero'
require_relative 'candy'

class Game < Gosu::Window

  def initialize
    super(900, 550, fullscreen: false)
    self.caption = 'Flying Hero!'
    @background = Background.new
    @hero = Hero.new
    @candy = Candy.new(self)
  end

  def draw
    @background.draw
    @hero.draw
    @candy.draw
  end

  def update
    @background.scroll!
    if button_down?(Gosu::KbDown)
      @hero.move_down! if (@hero.y + @hero.height) <= self.height
    end
    if button_down?(Gosu::KbUp)
      @hero.move_up! if @hero.y >= 0
    end
    @candy.move!
    if @candy.x < 0
      @candy.reset!(self)
    end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end
