class Game::AddPlayer
  def initialize(game, params)
    @game = game
    @params = params
  end
  attr_reader :game

  def execute
    return false if game.player_in_game.count >= game.num_player
    game.player_in_game.build(params)
    game.histories.build(
      :action => 'add_player',
      :params => params
    )
    if game.num_player > game.player_in_game.size
      game.status.num = game.status.num - 1
    else
      game.status.waiting_player!
      game.status.num = rand(game.num_player) + 1
    end
    game.save
  end

  private

  def params
    {
      :name => @params[:name],
      :external_id => @params[:external_id]
    }
  end

end
