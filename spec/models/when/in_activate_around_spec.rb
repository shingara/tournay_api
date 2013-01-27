require 'models/spec_helper'
require 'models/when_shared'

describe When::InPlaceAround do
  it_behaves_like 'inherit of When'

  it { should have_field(:building).of_type(Boolean) }
  it { should have_field(:prestige).of_type(Boolean) }
  it { should have_field(:people).of_type(Boolean) }

  # TODO: extract colors in Mongoid::Document
  it { should have_field(:colors).of_type(Array) }

  describe "#color=" do
    let(:color) { Color.new(:yellow) }
    it 'fill colors' do
      wa = When::InActivateAround.new(:color => color)
      expect(wa.colors).to eq [color]
    end
  end

end

