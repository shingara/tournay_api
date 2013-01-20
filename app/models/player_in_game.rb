class PlayerInGame
  include Mongoid::Document

  field :point, :type => Integer

  embedded_in :game
  embeds_many :citizens
  embeds_many :hand_cards, :class_name => "NeighborhoodCard"
  embeds_many :event_card

end
