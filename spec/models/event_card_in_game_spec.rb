require 'models/spec_helper'

describe EventCardInGame do

  it { should be_embedded_in(:game) }

  it { should have_field(:name).of_type(String) }
  it { should have_field(:state).of_type(String).with_default_value_of('in_deck') }

  it { should have_field(:denier_active).of_type(Integer) }
  it { should have_field(:denier_total).of_type(Integer) }
  it { should have_field(:cost_in_citizen).of_type(Integer) }
  it { should belong_to(:event_card) }

end
