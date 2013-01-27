require 'models/spec_helper'

describe EventCard do

  it { should be_embedded_in(:game) }
  it { should be_embedded_in(:player_in_game) }

  it { should have_field(:name).of_type(String) }

  it { should have_field(:denier_active).of_type(Integer) }
  it { should have_field(:denier_total).of_type(Integer) }
  it { should have_field(:cost_in_citizen).of_type(Integer) }

end
