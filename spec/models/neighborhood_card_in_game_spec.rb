require 'models/spec_helper'

describe NeighborhoodCardInGame do

  it { should have_field(:active).of_type(Boolean).with_default_value_of(false) }
  it { should have_field(:neighborhood_card).of_type(Moped::BSON::ObjectId) }

  it { should be_embedded_in(:player_in_game) }
  it { should be_embedded_in(:game) }

end
