class Citizen
  include Mongoid::Document

  field :color, :type => String
  field :engaged, :type => Boolean

  embedded_in :player_in_game
  embedded_in :game

end
