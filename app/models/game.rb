require 'mongoid'

class Game
  include Mongoid::Document

  field :num_player, :type => Integer, :default => 0

  embeds_many :player_in_game
  embeds_many :neighborhood_cards_in_game, :class_name => 'NeighborhoodCardInGame'
  embeds_many :event_cards_in_game, :class_name => 'EventCardInGame'
  embeds_many :citizens
  embeds_one :status, :class_name => 'GameStatus'
  embeds_many :histories, :class_name => 'GameHistory'

  validates_numericality_of :num_player, :greater_than => 1
  validates_presence_of :status

  def current_player_waiting
    if status.waiting_player?
      player_in_game[status.num - 1]
    else
      nil
    end
  end

  ##
  # All card of neighborhood in this game available in color and level
  # defined
  #
  # @example
  #   game.neighborhood_card_of(Color.new(:white), 2)
  #
  # @param [ Color ] color the color of card we want
  # @param [ Integer ] level the level of this card we want
  #
  # @return [ Array<NeighborhoodCardInGame> ] the list of card in this
  # condition
  #
  # @api public
  #
  def neighborhood_card_of(color, level)
    neighborhood_cards_in_game.where(:color => color, :level => level)
  end

end
