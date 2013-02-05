class GamesController < ApplicationController

  include ActionController::Rendering

  def start
    game_start = GameStart.new(params[:num_player])
    game_start.create
    @game = GameApiDecorator.new(game_start.game)
    render 'show', :status => 201, :formats => :json
  end

  def show
    game = Game.find(params[:id])
    if game
      @game = GameApiDecorator.new(game)
      render :show, :formats => :json
    else
      render :status => 404, :text => 'not found'
    end
  end
end
