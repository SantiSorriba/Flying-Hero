require 'gosu'
require_relative 'background'
require_relative 'hero'

class Game < Gosu::Window

  def initialize
    super(900, 550, fullscreen: false)
    self.caption = 'Flying Hero!'
    @background = Background.new
    @hero = Hero.new
  end

  def draw
    @background.draw
    @hero.draw
  end

  def update
    @background.scroll!
    if button_down?(Gosu::KbDown)
      @hero.move_down! if (@hero.y + @hero.height) <= self.height
    end
    if button_down?(Gosu::KbUp)
      @hero.move_up! if @hero.y >= 0
    end
    if button_down?(Gosu::KbLeft)
      @hero.move_left! if @hero.x >= 0
    end
    if button_down?(Gosu::KbRight)
      @hero.move_right! if (@hero.x + @hero.width) <= self.width
    end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end
