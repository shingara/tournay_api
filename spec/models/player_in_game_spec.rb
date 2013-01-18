require 'models/spec_helper'

describe PlayerInGame do
  it { should be_embedded_in(:game) }
  it { should have_field(:point).of_type(Integer) }

  it { should embeds_many(:citizens).of_type(Citizen) }

  it { should embeds_many(:hand_cards).of_type(NeighborhoodCard) }
end