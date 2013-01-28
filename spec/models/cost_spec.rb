require 'models/spec_helper'

describe Cost do
  it { should have_field(:denier).of_type(Integer) }
  it { should have_field(:citizen).of_type(Integer) }
  it { should have_field(:color).of_type(Color) }
  it { should have_field(:card).of_type(Integer) }

  it 'not valid without denier or citizen less than 1' do
    expect(Cost.new).to_not be_valid
    expect(Cost.new(:denier => 0, :citizen => 0)).to_not be_valid
  end


end
