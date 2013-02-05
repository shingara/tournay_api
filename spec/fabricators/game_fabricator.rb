class GameFabricator
  def initialize
    @games = []
  end
  def create
    @games << Game.new(
      :num_player => 2,
      :status => GameStatus.new(
        :state => :waiting_player
      )
    )
    @games.last
  end
end
