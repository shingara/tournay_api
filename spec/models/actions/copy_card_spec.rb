require 'models/spec_helper'
require 'models/action_shared'

describe Actions::CopyCard do
  it_behaves_like 'inherit of Action'
  it { should have_field(:color).of_type(Color) }
  it { should have_field(:activate).of_type(Boolean) }
end
