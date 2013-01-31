class GamesController < ApplicationController

  include ActionController::Rendering

  def start
    game_start = GameStart.new(params[:num_player])
    game_start.create
    @game = game_start.game
    render 'show', :status => 201, :formats => :json
  end
end
