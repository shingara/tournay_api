require 'models/spec_helper'
require 'models/action_shared'

describe Actions::GetCard do
  it_behaves_like 'inherit of Action'
  it { should have_field(:num).of_type(Integer) }
  it { should have_field(:color).of_type(Color) }
  it { should have_field(:level).of_type(Integer) }
end
