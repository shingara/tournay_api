require 'models/spec_helper'

describe CardAction do

  it { should have_attributes(:effect) }
  it { should have_attributes(:color_effect) }
  it { should have_attributes(:around) }

  let(:card_action) { CardAction.new(
    :effect => 'damage_building',
    :color_effect => 'yellow',
    :around => false
  )}

  describe "#mongoize" do
    it 'return a Integer' do
      CardAction.new({
        'effect' => 'damage_building',
        'color_effect' => 'yellow',
        'around' => false
      }).mongoize.should == {
        :effect => 'damage_building',
        :color_effect => 'yellow',
        :around => false
      }
    end
  end

  describe ".mongoize" do
    it 'return a CardAction object' do
      CardAction.mongoize({
        'effect' => 'damage_building',
        'color_effect' => 'yellow',
        'around' => false
      }).should == CardAction.new({
        'effect' => 'damage_building',
        'color_effect' => 'yellow',
        'around' => false
      })
    end
  end

  describe ".demongoize" do
    it 'return a Integer' do
      CardAction.demongoize(CardAction.new({
        'effect' => 'damage_building',
        'color_effect' => 'yellow',
        'around' => false
      })).should == CardAction.new({
        'effect' => 'damage_building',
        'color_effect' => 'yellow',
        'around' => false
      })
    end
  end

  describe ".evolve" do
    it 'return a CardAction object' do
      CardAction.evolve(CardAction.new({
        'effect' => 'damage_building',
        'color_effect' => 'yellow',
        'around' => false
      })).should == {
        :effect => 'damage_building',
        :color_effect => 'yellow',
        :around => false
      }
    end
  end

end
