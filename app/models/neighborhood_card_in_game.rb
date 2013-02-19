require 'state_machine'

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

  state_machine :state, :action => nil, :initial => :in_deck do
    state :in_deck
    state :waiting_draw
    state :visible_in_deck
    state :in_player_hand

    event :wait_draw do
      transition [:in_deck] => :waiting_draw
    end

    event :get_in_player_hand do
      transition [:waiting_draw] => :in_player_hand
    end

    event :back_visible_in_deck do
      transition [:waiting_draw] => :visible_in_deck
    end
  end


  def player=(player)
    self.player_in_game_id = player.id
  end

end
