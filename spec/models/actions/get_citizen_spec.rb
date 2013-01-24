require 'models/spec_helper'
require 'models/action_shared'

describe Actions::GetCitizen do
  it_behaves_like 'inherit of Action'
  it { should have_field(:cost).of_type(Integer) }
  it { should have_field(:color).of_type(Color) }
end
