class Game
  include Mongoid::Document

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

  embeds_many :event_cards
  embeds_many :citizens

end
