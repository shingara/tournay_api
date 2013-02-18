require 'adamantium'

class Play::GetCard

  include Adamantium::Flat

  def initialize(game, player, params)
    @game = game
    @player = player
    @params = params
  end

  def valid?
    @params.keys.include?(:color) &&
    @params.keys.include?(:level) &&
    @player.citizens_ready_in(color) == level &&
    @game.neighborhood_card_of(color, level).size > 0
  end

  def action
    @player.engaged_citizens(color, level)
    card_choose.player = @player
    card_choose.get_in_player_hand
    card_not_choose.map(&:back_visible_in_deck)
  end

  private

  def card_choose
    @game.neighborhood_cards_in_game.find(card_id)
  end
  memoize :card_choose, :freezer => :noop

  def card_not_choose
    @game.neighborhood_cards_in_game.where(
      :id => {'$ne' => card_choose.id},
      :state => 'waiting_draw'
    )
  end
  memoize :card_not_choose, :freezer => :noop

  def card_id
    @params[:card_id]
  end
  memoize :card_id

  def color
    Color.new(@params[:color])
  end
  memoize :color

  def level
    @params[:level].to_i
  end

end
