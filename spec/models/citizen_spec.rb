require 'models/spec_helper'

describe Citizen do

  it { should be_embedded_in(:player_in_game) }
  it { should have_field(:color).of_type(String) }
  it { should have_field(:engaged).of_type(Boolean) }

end