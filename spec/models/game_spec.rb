require 'models/spec_helper'

describe Game do
  describe "Attributes" do
    it { should embeds_many(:player_in_game) }

    it { should embeds_many(:red_cards_one).of_type(:neighborhood_card) }
    it { should embeds_many(:red_cards_two).of_type(:neighborhood_card) }
    it { should embeds_many(:red_cards_third).of_type(:neighborhood_card) }

    it { should embeds_many(:white_cards_one).of_type(:neighborhood_card) }
    it { should embeds_many(:white_cards_two).of_type(:neighborhood_card) }
    it { should embeds_many(:white_cards_third).of_type(:neighborhood_card) }

    it { should embeds_many(:yellow_cards_one).of_type(:neighborhood_card) }
    it { should embeds_many(:yellow_cards_two).of_type(:neighborhood_card) }
    it { should embeds_many(:yellow_cards_third).of_type(:neighborhood_card) }
  end
end
