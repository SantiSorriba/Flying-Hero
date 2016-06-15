require 'gosu'

class Hero
  attr_accessor :y , :height, :x, :width

  def initialize
    @sprites = Gosu::Image::load_tiles('assets/images/cat.png', 852/6, 87, tileable: false)
    @x = 0
    @y = 225
    @width = @sprites.first.width
    @height = @sprites.first.height
  end

  def draw
    sprite = @sprites[Gosu::milliseconds / 75 % @sprites.size]
    sprite.draw(@x, @y, 1)
  end

  def move_up!
    @y -=  5
  end

  def move_down!
    @y +=  5
  end

  def move_left!
    @x -=  5
  end

  def move_right!
    @x +=  5
  end

end
