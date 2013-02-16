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
  end

  private

  def color
    Color.new(@params[:color])
  end
  memoize :color

  def level
    @params[:level].to_i
  end

end
