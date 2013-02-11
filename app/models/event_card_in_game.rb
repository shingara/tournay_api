class EventCardInGame

  include Mongoid::Document

  field :name, :type => String

  field :denier_active, :type => Integer
  field :denier_total, :type => Integer
  field :cost_in_citizen, :type => Integer
  field :play, :type => Boolean, :default => false

  embedded_in :game
  embedded_in :player_in_game

  belongs_to :event_card

end
