require 'fabricators/card_fabricator'
require 'spec_helper'

describe Play::GetCard do
  let(:game) {
    Game.new(:neighborhood_cards_in_game => [
      NeighborhoodCardInGame.new(:color => Color.new(:white), :level => 2)
    ])
  }
  let(:citizens) {
      [
        Citizen.new(:color => Color.new(:white), :engaged => false),
        Citizen.new(:color => Color.new(:white), :engaged => false),
        Citizen.new(:color => Color.new(:red), :engaged => true),
        Citizen.new(:color => Color.new(:red), :engaged => false),
      ]
  }
  let(:player_in_game) {
    PlayerInGame.new(
      :citizens => citizens
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
        Game.new(:neigborhood_cards_in_game => [
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
    context "with card to see by player" do

      let(:params) {
        {:color => 'white', :level => 2, :card_id => neighborhood_cards.first.id.to_s }
      }
      let(:neighborhood_cards) {
        cards = CardFabricator.new.create_neighborhood_in_game(2)
        cards.each {|c| c.state = 'waiting_draw' }
        cards
      }

      let(:player_in_game) {
        PlayerInGame.new(
          :citizens => citizens,
          :neighborhood_cards_to_see => neighborhood_cards
        )
      }

      let(:game) {
        Game.new(:neighborhood_cards_in_game => neighborhood_cards)
      }

      it 'engaged citizen needed' do
        expect {
          play_get_card.action
        }.to change{
          player_in_game.citizens_ready_in(Color.new(:white))
        }.by(-2)
      end

      it 'fill player_in_game field of neighborhood card' do
        expect {
          play_get_card.action
        }.to change {
          game.neighborhood_cards_in_game.find(neighborhood_cards.first.id).player_in_game_id
        }.from(nil).to(player_in_game.id)
      end

      it 'get card in player hand' do
        expect {
          play_get_card.action
        }.to change {
          game.neighborhood_cards_in_game.find(neighborhood_cards.first.id).in_player_hand?
        }.from(false).to(true)
      end

      it 'see card not get by player' do
        expect {
          play_get_card.action
        }.to change {
          game.neighborhood_cards_in_game.find(neighborhood_cards[1].id).visible_in_deck?
        }.from(false).to(true)

      end

    end
    it 'get a level 2 card in this color in player hand'
    it 'need manage 2 case when there are no card display and card display'
  end

end
