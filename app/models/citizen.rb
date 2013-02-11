class Citizen
  include Mongoid::Document

  field :color, :type => Color
  field :engaged, :type => Boolean

  embedded_in :player_in_game
  embedded_in :game

end
