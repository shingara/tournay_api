class PlayerInGame
  include Mongoid::Document

  field :name, :type => String
  field :external_id
  field :point, :type => Integer

  embedded_in :game
  embeds_many :citizens
  embeds_many :hand_cards, :class_name => "NeighborhoodCardInGame"
  embeds_many :event_cards_in_game, :class_name => 'EventCardInGame'

end
