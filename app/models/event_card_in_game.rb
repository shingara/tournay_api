class EventCardInGame

  include Mongoid::Document

  field :name, :type => String

  field :denier_active, :type => Integer
  field :denier_total, :type => Integer
  field :cost_in_citizen, :type => Integer
  field :player_in_game_id, :type => Moped::BSON::ObjectId
  field :state, :type => String, :default => 'in_deck'

  embedded_in :game

  belongs_to :event_card

end
