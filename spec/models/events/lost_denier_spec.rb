require 'models/spec_helper'

describe Events::LostDenier do

  it { should have_field(:num).of_type(Integer) }
  it { should be_embedded_in(:event_card) }

end
