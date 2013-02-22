require 'models/spec_helper'

describe Crieur do
  it { should have_field(:color).of_type(Color) }
  it { should have_field(:level).of_type(Integer) }
  it { should have_field(:state) }
  it { should be_embedded_in(:game) }
end
