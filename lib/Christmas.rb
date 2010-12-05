require 'gosu'

module Blizzard
  FILE_PATH = File.expand_path(File.dirname(__FILE__))
  class Flake
    attr_reader :x, :y
    def initialize(window)
      @window = window
      @x = rand(@window.width)
      @y = -3
      file_name = File.join(FILE_PATH, "media", "Blizzard.png")
      @image = Gosu::Image.new(@window, file_name , true)
      
    end
    
    def update
      @y += 2
    end
    
    def draw
      @image.draw(@x ,@y, 0)
    end
  end
  
  class BlizzardApp < Gosu::Window
    
    SCREEN_WIDTH = 640
    SCREEN_HEIGHT = 480
    RESET = 100000
    def initialize()
      super(SCREEN_WIDTH, SCREEN_HEIGHT, true)
      self.caption = "Holiday message"
      @flakes = []
      reset
      @text_image = Gosu::Image.from_text(self, "Merry\nChristmas", "Arial", 90, 5, 300,:center )
    end
    def update
      @counter += 1
      if @counter % RESET == 0 
        reset
      end
      if @counter % @speed == 0
        @step -=5 unless @step <= 5
      end
      if @counter % @step == 0
        @flakes << Flake.new(self)
      end
      @flakes.each do |flake|
        flake.update
        @flakes.delete(flake) if flake.y > SCREEN_HEIGHT
      end
    end
    
    def draw
      @flakes.each do |flake|
        flake.draw
      end
      @text_image.draw(
        (SCREEN_WIDTH - @text_image.width)/2 ,
        (SCREEN_HEIGHT - @text_image.height)/2,4, 1, 1, Gosu::Color::RED)
    end
    def reset
      @counter = 0
      @speed = 200
      @step = 25
    end
    
    def button_down id
      close if id == Gosu::KbEscape
    end
    
  end
  
end

window = Blizzard::BlizzardApp.new
window.show