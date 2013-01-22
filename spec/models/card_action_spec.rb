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
  it { should have_attributes(:cost) }
  it { should have_attributes(:copy_action_not_activate) }
  it { should have_attributes(:get_back_citizen_in_place) }
  it { should have_attributes(:get_one_card_on) }
  it { should have_attributes(:get_two_card_on) }
  it { should have_attributes(:get_new_citizen) }
  it { should have_attributes(:on_empty_neighborhood) }
  it { should have_attributes(:twice_activate) }

  let(:card_action) { CardAction.new(
    :color_effect => Color.new(:grey),
    :around => true,
    :in_activate => false,
    :in_place => true,
    :on_people => false,
    :on_building => true,
    :win => true,
    :denier => 1,
    :cost => false,
    :copy_action_not_activate => false,
    :get_back_citizen_in_place => false,
    :get_one_card_on => 0,
    :get_two_card_on => 0,
    :get_new_citizen => false,
    :on_empty_neighborhood => false,
    :twice_activate => false,
  )}

  let(:card_action_document) {{
    :color_effect => 4,
    :around => true,
    :in_activate => false,
    :in_place => true,
    :on_people => false,
    :on_building => true,
    :win => true,
    :denier => 1,
    :cost => false,
    :copy_action_not_activate => false,
    :get_back_citizen_in_place => false,
    :get_one_card_on => 0,
    :get_two_card_on => 0,
    :get_new_citizen => false,
    :on_empty_neighborhood => false,
    :twice_activate => false,
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
