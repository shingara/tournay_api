class CardFabricator
  def initialize
    @cards = []
  end

  def create_neighborhood_in_game(num=1)
    new_cards = [].tap {|create_cards|
      num.times do |t|
        create_cards << NeighborhoodCardInGame.new(
          :level => 2,
          :color => Color.new(:red)
        )
      end
    }
    @cards |= new_cards
    new_cards
  end
end
