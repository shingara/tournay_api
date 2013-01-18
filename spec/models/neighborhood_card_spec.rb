require 'models/spec_helper'

describe NeighborhoodCard do
  it { should be_embedded_in(:player_in_game) }
  it { should have_field(:color).of_type(String) }
  it { should have_field(:victory_point).of_type(Integer) }
  it { should have_field(:cost).of_type(Integer) }
  it { should have_field(:name).of_type(String) }
  it { should have_field(:action).of_type(String) }
end
