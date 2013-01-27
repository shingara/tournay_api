require 'models/spec_helper'
require 'models/action_shared'

describe Actions::AgainstEvent do
  it_behaves_like 'inherit of Action'
  it { should have_field(:num).of_type(Integer).with_default_value_of(0) }
  it { should have_field(:with_denier).of_type(Integer).with_default_value_of(0) }
  it { should have_field(:get_denier).of_type(Boolean).with_default_value_of(false) }

  it 'not valid if no num' do
    expect(Actions::AgainstEvent.new(:num => 0)).to_not be_valid
  end
end
