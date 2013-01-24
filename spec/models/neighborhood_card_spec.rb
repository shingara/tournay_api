require 'models/spec_helper'

describe NeighborhoodCard do

  it { should have_field(:color).of_type(Color) }
  it { should have_field(:victory_point).of_type(Integer) }
  it { should have_field(:level).of_type(Integer) }
  it { should have_field(:cost).of_type(Integer) }
  it { should have_field(:name).of_type(String) }
  it { should have_field(:card_type).of_type(String) }

  describe "#people?" do
    it 'return true' do
      NeighborhoodCard.new(:card_type => 'people').people?.should be_true
    end
  end

end
