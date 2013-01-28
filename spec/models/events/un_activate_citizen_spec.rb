require 'models/spec_helper'

describe Events::UnActivateCitizen do

  it { should have_field(:color).of_type(Color) }
  it { should be_embedded_in(:event_card) }

end
