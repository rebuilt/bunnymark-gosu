require 'gosu'

HEIGHT = 720
WIDTH = 1280
class Bunny
  attr_accessor :x, :y, :dx, :dy, :color

  def initialize(image_width)
    @x = rand(WIDTH - image_width)
    @y = rand(HEIGHT - image_width)
    @dx = rand(11) - 5
    @dy = rand(11) - 5
    @color = Gosu::Color.argb(0xff, rand(256), rand(256), rand(256))
  end

  def update
    @x += @dx
    @y += @dy

    if @x <= 0 || @x >= WIDTH - 20
      @dx *= -1
    end

    if @y <= 0 || @y >= HEIGHT - 20
      @dy *= -1
    end
  end
end

class BunnyMarkWindow < Gosu::Window
  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "BunnyMark - Gosu"

    @bunny_image = Gosu::Image.new("resources/raybunny.png")
    @font = Gosu::Font.new(24)

    @bunnies = 1000.times.map do
      Bunny.new(@bunny_image.width)
    end
  end

  def update
    @bunnies.each do |bunny|
      bunny.update
    end
  end

  def draw
    @bunnies.each do |bunny|
      @bunny_image.draw(bunny.x, bunny.y, 0, 1, 1, bunny.color)
    end

    fps = Gosu.fps
    if fps >= 60
      i = 0

      while  i < 5
       @bunnies << Bunny.new(@bunny_image.width) 
       i += 1
      end
    elsif fps < 60 && @bunnies.size >= 5
      @bunnies.pop(1)
    end
    @font.draw_text("bunnies: #{@bunnies.size}", 40, 40, 1, 1, 1, 0xff_ffffff)
    @font.draw_text("FPS: #{fps}", 40, 70, 1, 1, 1, 0xff_ffffff)
    @font.draw_text("Press ESC to quit", 40, 100, 1, 1, 1, 0xff_808080)
  end

  def button_down(id)
    if id == Gosu::MS_LEFT
      1000.times do
        @bunnies << Bunny.new(@bunny_image.width)
        @bunnies.last.x = mouse_x - @bunny_image.width / 2
        @bunnies.last.y = mouse_y - @bunny_image.height / 2
      end
    else
      close if id == Gosu::KB_ESCAPE
    end
  end
end

BunnyMarkWindow.new.show
