require 'models/spec_helper'

describe Game do
  it { should embed_many(:player_in_game) }

  it { should embed_many(:red_cards_one).of_type(NeighborhoodCard) }
  it { should embed_many(:red_cards_two).of_type(NeighborhoodCard) }
  it { should embed_many(:red_cards_third).of_type(NeighborhoodCard) }

  it { should embed_many(:white_cards_one).of_type(NeighborhoodCard) }
  it { should embed_many(:white_cards_two).of_type(NeighborhoodCard) }
  it { should embed_many(:white_cards_third).of_type(NeighborhoodCard) }

  it { should embed_many(:yellow_cards_one).of_type(NeighborhoodCard) }
  it { should embed_many(:yellow_cards_two).of_type(NeighborhoodCard) }
  it { should embed_many(:yellow_cards_third).of_type(NeighborhoodCard) }

  it { should embed_many(:event_cards).of_type(EventCard) }

  it { should embed_many(:citizens).of_type(Citizen) }
end
