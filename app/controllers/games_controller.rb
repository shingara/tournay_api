class GamesController < ApplicationController

  include ActionController::Rendering

  def start
    game_start = GameStart.new(params[:num_player])
    game_start.create
    @game = GameApiDecorator.new(game_start.game)
    render 'show', :status => 201, :formats => :json
  end

  def show
    if game
      @game = GameApiDecorator.new(game)
      render :show, :formats => :json
    else
      render :status => 404, :text => 'not found'
    end
  end

  def add_player
    add_player = Game::AddPlayer.new(game, add_player_params)
    add_player.execute
    @game = GameApiDecorator.new(add_player.game)
    render 'show', :status => 201, :formats => :json
  end

  private

  def game
    @_game ||= Game.find(params[:id])
  end

  def add_player_params
    {
      :external_id => params[:external_id],
      :name => params[:name]
    }
  end
end
