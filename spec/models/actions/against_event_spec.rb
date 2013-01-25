require 'models/spec_helper'
require 'models/action_shared'

describe Actions::AgainstEvent do
  it_behaves_like 'inherit of Action'
  it { should have_field(:with_denier).of_type(Integer) }
  it { should have_field(:get_denier).of_type(Boolean).with_default_value_of(false) }
end
