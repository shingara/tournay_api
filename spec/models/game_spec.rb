require 'fabricators/game_fabricator'
require 'models/spec_helper'

describe Game do

  it { should have_field(:num_player).of_type(Integer) }

  it { should embed_many(:player_in_game) }
  it { should embed_many(:neighborhood_card).of_type(NeighborhoodCardInGame) }
  it { should embed_many(:event_cards_in_game).of_type(EventCardInGame) }
  it { should embed_many(:citizens).of_type(Citizen) }
  it { should embed_one(:status).of_type(GameStatus) }

  it { expect(Game.new(:num_player => 1)).to_not be_valid }
  it { expect(GameFabricator.new.create).to be_valid }
  it 'not valid without game_status' do
    expect(Game.new(:status => nil)).to_not be_valid
  end
end
