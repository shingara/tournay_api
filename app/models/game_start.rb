require 'adamantium'
require 'game'
require 'neighborhood_card'

class GameStart

  include Adamantium

  def initialize(num_player)
    @num_player = num_player
  end

  def game
    Game.new(
      :num_player => @num_player,
      :status => GameStatus.new(:state => :waiting_player)
    )
  end
  memoize :game, :freezer => :noop


  def create
    add_neighborhood_card
    game.save
  end

  private

  def add_neighborhood_card
    NeighborhoodCard.all.each do |card|
      game.neighborhood_card.build(
        :active => false,
        :neighborhood_car_id => card.id,
        :level => card.level,
        :color => card.color
      )
    end
  end

end
