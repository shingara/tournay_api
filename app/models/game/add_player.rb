
class Game::AddPlayer

  def initialize(game, params)
    @game = game
    @params = params
  end
  attr_reader :game, :player

  def execute
    return false if game.player_in_game.count >= game.num_player
    @player = game.player_in_game.build(params)
    game.histories.build(
      :action => 'add_player',
      :params => initial_params
    )
    change_status
    game.save
  end

  private

  def change_status
    if game.num_player > game.player_in_game.size
      game.status.num = game.status.num - 1
    else
      game.status.waiting_player!
      game.status.num = rand(game.num_player) + 1
    end
  end

  def initial_params
    {
      :name => @params[:name],
      :external_id => @params[:external_id],
    }
  end

  def params
    initial_params.merge({
      :denier => 6,
      :citizens => citizens_to_start
    })
  end

  def citizens_to_start
    @citizens ||= [].tap {|citizens|
      [:red, :yellow, :white].each do |color|
        2.times {
          citizens << {'color' => Color.new(color), 'engaged' => false}
        }
      end
    }
  end

end
