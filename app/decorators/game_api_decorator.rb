require 'draper'

class GameApiDecorator < Draper::Decorator
  decorates :game
  decorates_association :player_in_game

  def links
    {
      'self' => {
        'href' => h.game_url(model.id)
      },
      'add_player' => {
        'href' => h.add_player_game_url(model.id),
        'method' => 'post',
        'params' => ['name', 'id']
      },
      'play' => {
        'href' => h.play_game_url(model.id),
        'method' => 'post',
        'params' => ['player_id', 'action', 'color', 'level']
      }
    }
  end

  def status
    model.status.translate
  end

end
