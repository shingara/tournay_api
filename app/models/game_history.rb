class GameHistory
  include Mongoid::Document

  field :action, :type => String
  field :params, :type => Hash

  embedded_in :game
end
