require 'gosu'

module Blizzard
  FILE_PATH = File.expand_path(File.dirname(__FILE__))
  class Flake
    def initialize(window)
      @window = window
      @x = rand(@window.witdh)
      @y = -1
      file_name = File.join(FILE_PATH, "media", "Blizzard.png")
      @image = Gosu::Image.new(self, file_name , true)
    end
    
    def update
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
      
    end
    
    def draw
      @flakes.each do |flake|
        flake.draw
      end
    end
    def reset
      @counter = 0
    end
  end
  
end

window = Blizzard::BlizzardApp.new
window.show