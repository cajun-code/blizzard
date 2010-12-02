require 'gosu'

module Blizzard
  
  class BlizzardApp < Gosu::Window
    FILE_PATH = File.expand_path(File.dirname(__FILE__))
    SCREEN_WIDTH = 640
    SCREEN_HEIGHT = 480
    def initialize()
      super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
      self.caption = "Blizzard attack"
      file_name = File.join(FILE_PATH, "media", "Blizzard.png")
      puts file_name
      @flake = Gosu::Image.new(self, file_name , true)
    end
    def update
    end
    
    def draw
      @flake.draw((SCREEN_WIDTH - @flake.width)/2 ,(SCREEN_HEIGHT - @flake.height)/2, 0)
    end
  end
  
end

window = Blizzard::BlizzardApp.new
window.show