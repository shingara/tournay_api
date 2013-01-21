class NeighborhoodCardInGame
  include Mongoid::Document

  field :active, :type => Boolean, :default => false
  field :neighborhood_card, :type => Moped::BSON::ObjectId

  embedded_in :player_in_game
  embedded_in :game

end
