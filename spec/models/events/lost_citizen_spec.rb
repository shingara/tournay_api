require 'models/spec_helper'

describe Events::LostCitizen do

  it { should have_field(:num).of_type(Integer) }
  it { should have_field(:color).of_type(Color) }

  it { should be_embedded_in(:event_card) }

end
