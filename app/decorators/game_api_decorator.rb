require 'draper'

class GameApiDecorator < Draper::Decorator
  decorates :game

  def links
    {
      'self' => h.game_url(self)
    }
  end

end
