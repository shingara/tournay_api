require 'draper'

class GameApiDecorator < Draper::Decorator
  decorates :game

  def links
    {
      'self' => h.game_url(model.id),
    }
  end

  def status
    model.status.translate
  end

end
