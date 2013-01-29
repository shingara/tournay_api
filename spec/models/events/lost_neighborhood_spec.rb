require 'models/spec_helper'

describe Events::LostNeighborhood do

  it { should have_field(:num).of_type(Integer) }
  it { should have_field(:color).of_type(Color) }
  it { should have_field(:building).of_type(Boolean) }
  it { should have_field(:people).of_type(Boolean) }

  it { should be_embedded_in(:event_card) }

end
