class Game
  include Mongoid::Document

  field :num_player, :type => Integer, :default => 0

  embeds_many :player_in_game

  embeds_many :red_cards_one, :class_name => 'NeighborhoodCard'
  embeds_many :red_cards_two, :class_name => 'NeighborhoodCard'
  embeds_many :red_cards_third, :class_name => 'NeighborhoodCard'

  embeds_many :white_cards_one, :class_name => 'NeighborhoodCard'
  embeds_many :white_cards_two, :class_name => 'NeighborhoodCard'
  embeds_many :white_cards_third, :class_name => 'NeighborhoodCard'

  embeds_many :yellow_cards_one, :class_name => 'NeighborhoodCard'
  embeds_many :yellow_cards_two, :class_name => 'NeighborhoodCard'
  embeds_many :yellow_cards_third, :class_name => 'NeighborhoodCard'

  embeds_many :event_cards_in_game, :class_name => 'EventCardInGame'
  embeds_many :citizens

  validates_numericality_of :num_player, :greater_than => 1

end
