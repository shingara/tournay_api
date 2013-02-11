class NeighborhoodCardInGame
  include Mongoid::Document

  field :active, :type => Boolean, :default => false
  field :color, :type => Color
  field :level, :type => Integer
  field :neighborhood_card_id, :type => Moped::BSON::ObjectId
  field :play, :type => Boolean, :default => false

  embedded_in :player_in_game
  embedded_in :game

end
