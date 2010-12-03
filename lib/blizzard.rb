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
    def initialize()
      super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
      self.caption = "Blizzard attack"
      @flakes = []
      @speed = 200
      @step = 25
      @counter = 0
      @reset = 100000
    end
    def update
      @counter += 1
      if @counter % @reset == 0 
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
    end
    def reset
      @counter = 0
      @speed = 200
      @step = 25
    end
  end
  
end

window = Blizzard::BlizzardApp.new
window.show