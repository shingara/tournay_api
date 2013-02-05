require 'draper'

class GameApiDecorator < Draper::Decorator
  decorates :game

  def links
    {
      'self' => h.game_url(self)
    }
  end

  def status
    model.status.translate
  end

end
