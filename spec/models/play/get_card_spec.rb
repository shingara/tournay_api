require 'spec_helper'

describe Play::GetCard do
  let(:game) {
    Game.new(:neighborhood_card => [
      NeighborhoodCardInGame.new(:color => Color.new(:white), :level => 2)
    ])
  }
  let(:player_in_game) {
    PlayerInGame.new(
      :citizens => [
        Citizen.new(:color => Color.new(:white), :engaged => false),
        Citizen.new(:color => Color.new(:white), :engaged => false),
        Citizen.new(:color => Color.new(:red), :engaged => true),
        Citizen.new(:color => Color.new(:red), :engaged => false),
      ]
    )
  }
  let(:params) {
    {:color => 'white', :level => 2}
  }
  let(:play_get_card) { Play::GetCard.new(game, player_in_game, params) }

  describe "#valid?" do

    it 'not valid without color and level params' do
      expect(Play::GetCard.new(game, player_in_game, {}).valid?).to eq false
    end

    context "without enough citizen ready in color" do
      let(:params) {
        {:color => 'red', :level => 2}
      }
      it 'not valid' do
        expect(play_get_card.valid?).to eq false
      end
    end

    context "with enough citizen ready" do
      let(:player_in_game) {
        PlayerInGame.new(
          :citizens => [
            Citizen.new(:color => Color.new(:white), :engaged => false),
            Citizen.new(:color => Color.new(:white), :engaged => false),
          ]
        )
      }
      it 'valid' do
        expect(play_get_card.valid?).to eq true
      end
    end

    context "without enough card of this color available" do
      let(:game) {
        Game.new(:neigborhood_card => [
          NeighborhoodCardInGame.new(:color => Color.new(:white), :level => 3)
        ])
      }
      it 'not valid' do
        expect(play_get_card.valid?).to be false
      end
    end

    it 'valid with color and level params' do
      expect(play_get_card.valid?).to eq true
    end

  end

  describe "#action" do
    it 'engaged citizen needed'
    it 'get a level 2 card in this color in player hand'
  end

end
