class Game::Actions::GetCard

  def initialize(game, params)
    @game = game
    @params = params
  end

  def valid?
    p @params.keys
    @params.keys.include?([:color, :level])
  end

end
