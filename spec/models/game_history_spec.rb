require 'models/spec_helper'

describe GameHistory do
  it { should have_field(:action).of_type(String) }
  it { should have_field(:params).of_type(Hash) }

  it { should be_embedded_in(:game) }
end
