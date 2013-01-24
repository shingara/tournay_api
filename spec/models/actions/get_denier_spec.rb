require 'models/spec_helper'
require 'models/action_shared'

describe Actions::GetDenier do
  it_behaves_like 'inherit of Action'
  it { should have_field(:num).of_type(Integer) }
end
