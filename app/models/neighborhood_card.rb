class NeighborhoodCard
  include Mongoid::Document

  field :color, :type => Color
  field :victory_point, :type => Integer
  field :cost, :type => Integer
  field :name, :type => String
  field :active, :type => Boolean, :default => false
  field :action, :type => CardAction
  field :card_type, :type => String

  embedded_in :player_in_game
  embedded_in :game

  def people?
    card_type == 'people'
  end

end
