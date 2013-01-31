require 'adamantium'

class GameStart

  include Adamantium

  def initialize(num_player)
    @num_player = num_player
  end

  def game
    Game.new(:num_player => @num_player)
  end
  memoize :game, :freezer => :noop

  def create
    game.save
  end

end
