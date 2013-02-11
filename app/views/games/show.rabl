object @game
attributes :links, :status
child :player_in_game => :players do
  attributes :name, :id, :denier, :citizens, :hand_cards, :place_cards
  code(:id) {|player|
    player.external_id
  }
end
