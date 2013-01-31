require 'mongoid'

class Game
  include Mongoid::Document

  field :num_player, :type => Integer, :default => 0

  embeds_many :player_in_game
  embeds_many :neighborhood_card, :class_name => 'NeighborhoodCardInGame'
  embeds_many :event_cards_in_game, :class_name => 'EventCardInGame'
  embeds_many :citizens

  validates_numericality_of :num_player, :greater_than => 1

end
