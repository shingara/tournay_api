require 'models/spec_helper'

describe EventCard do

  it { should have_field(:name).of_type(String) }

  it { should have_field(:denier_total).of_type(Integer) }

  it { should embed_one(:cost).of_type(Cost) }
  it { should embed_one(:event) }

end
