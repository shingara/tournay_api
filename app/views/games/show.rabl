object @game
attributes :links, :status
child :player_in_game => :players do
  attributes :name, :id
end
