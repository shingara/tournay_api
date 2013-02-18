class NeighborhoodCardInGame
  include Mongoid::Document

  field :active, :type => Boolean, :default => false
  field :color, :type => Color
  field :level, :type => Integer
  field :neighborhood_card_id, :type => Moped::BSON::ObjectId
  field :player_in_game_id, :type => Moped::BSON::ObjectId
  field :visible, :type => Boolean, :default => false
  field :state, :type => String, :default => 'in_deck'

  embedded_in :game

  def wait_draw
    self.state = 'waiting_draw' if in_deck?
  end

  def get_back_in_deck
    self.state = 'visible_in_deck' if waiting_draw?
  end

  def in_deck?
    self.state == 'in_deck'
  end

  def waiting_draw?
    self.state == 'waiting_draw'
  end

  def get_in_player_hand
    self.state = 'in_player_hand' if waiting_draw?
  end

  def player=(player)
    self.player_in_game_id = player.id
  end

  def in_player_hand?
    self.state == 'in_player_hand'
  end

  def back_visible_in_deck
    self.state = 'visible_in_deck' if waiting_draw?
  end

  def visible_in_deck?
    self.state == 'visible_in_deck'
  end

end
