class EventCard

  include Mongoid::Document

  field :card_action, :type => CardAction
  field :name, :type => String
  field :denier_active, :type => Integer
  field :denier_total, :type => Integer
  field :cost_in_citizen, :type => Integer

  embedded_in :game
  embedded_in :player_in_game


end
