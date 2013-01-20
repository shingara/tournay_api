require 'models/spec_helper'

describe CardAction do

  it { should have_attributes(:color_effect) }
  it { should have_attributes(:around) }
  it { should have_attributes(:in_activate) }
  it { should have_attributes(:in_place) }
  it { should have_attributes(:on_people) }
  it { should have_attributes(:on_building) }
  it { should have_attributes(:win) }
  it { should have_attributes(:denier) }

  let(:card_action) { CardAction.new(
    :color_effect => Color.new(:grey),
    :around => true,
    :in_activate => false,
    :in_place => true,
    :on_people => false,
    :on_building => true,
    :win => true,
    :denier => 1
  )}

  let(:card_action_document) {{
    :color_effect => 4,
    :around => true,
    :in_activate => false,
    :in_place => true,
    :on_people => false,
    :on_building => true,
    :win => true,
    :denier => 1
  }}

  describe "#mongoize" do
    it 'return a Integer' do
      card_action.mongoize.should == card_action_document
    end
  end

  describe ".mongoize" do
    it 'return a CardAction object' do
      CardAction.mongoize(card_action_document).should == card_action_document
    end
  end

  describe ".demongoize" do
    it 'return a CardAction object' do
      CardAction.demongoize(card_action).should == card_action
    end
  end

  describe ".evolve" do
    it 'return a CardAction object' do
      CardAction.evolve(card_action).should == card_action_document
    end
  end

end
