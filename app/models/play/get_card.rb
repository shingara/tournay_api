class Play::GetCard

  def initialize(game, params)
    @game = game
    @params = params
  end

  def valid?
    @params.keys.include?([:color, :level])
  end

end
