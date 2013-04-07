require 'models/spec_helper'

describe VictoryPoint do

  it { should have_field(:own).of_type(Integer) }
  it { should have_field(:other).of_type(Integer) }
  it { should have_field(:condition).of_type(String) }

  it { should validate_inclusion_of(:condition).to_allow(["triple_neighborhood_color"]) }


end
