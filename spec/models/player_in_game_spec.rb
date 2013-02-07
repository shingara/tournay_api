require 'models/spec_helper'

describe PlayerInGame do

  it { should have_field(:point).of_type(Integer) }
  it { should have_field(:external_id) }
  it { should have_field(:name).of_type(String) }

  it { should be_embedded_in(:game) }

  it { should embed_many(:citizens).of_type(Citizen) }

  it { should embed_many(:hand_cards).of_type(NeighborhoodCardInGame) }
  it { should embed_many(:event_cards_in_game).of_type(EventCardInGame) }
end
