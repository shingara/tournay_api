require 'play/get_card'

class Game::Play

  def initialize(game, params)
    @game = game
    @params = params
  end
  attr_reader :game, :errors

  def play
    unless game.current_player_waiting
      @errors = ['no_player']
      return false
    end
    unless game.current_player_waiting.external_id == player_id
      @errors = ['bad_player_to_play']
      return false
    end
    unless action.valid?
      @errors = ['not_all_args']
      return false
    end
    @errors.empty?
  end

  private

  def player_id
    @params['player_id']
  end

  def action
    @action ||= send(@params[:action])
  end

  def get_card
    Play::GetCard.new(game, @params)
  end
end
