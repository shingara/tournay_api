require 'models/spec_helper'
require 'models/action_shared'

describe Actions::CopyCard do
  it_behaves_like 'inherit of Action'
  it { should have_field(:color).of_type(Color) }
  it { should have_field(:activate).of_type(Boolean) }
  it { should have_field(:building).of_type(Boolean) }
  it { should have_field(:prestige).of_type(Boolean) }
  it { should have_field(:people).of_type(Boolean) }

  it 'not valid if no building prestige or people define true' do
    expect(Actions::CopyCard.new).to_not be_valid
  end
end
