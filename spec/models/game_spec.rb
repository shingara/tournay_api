require 'models/spec_helper'

describe Game do

  it { should have_field(:num_player).of_type(Integer) }

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

  it { should embed_many(:event_cards_in_game).of_type(EventCardInGame) }

  it { should embed_many(:citizens).of_type(Citizen) }

  it { expect(Game.new(:num_player => 1)).to_not be_valid }
  it { expect(Game.new(:num_player => 2)).to be_valid }
end
