require 'models/spec_helper'

describe NeighborhoodCardInGame do

  let(:neighborhood_card_in_game) {
    NeighborhoodCardInGame.new
  }

  let(:player_in_game) {
    PlayerInGame.new
  }

  it { should have_field(:active).of_type(Boolean).with_default_value_of(false) }
  it { should have_field(:neighborhood_card_id).of_type(Moped::BSON::ObjectId) }
  it { should have_field(:player_in_game_id).of_type(Moped::BSON::ObjectId) }
  it { should have_field(:color).of_type(Color) }
  it { should have_field(:level).of_type(Integer) }
  it { should have_field(:state) }

  it { should be_embedded_in(:game) }

  describe "#state" do
    let!(:game) { Game.new(:neighborhood_cards_in_game => [neighborhood_card_in_game]) }

    describe :in_deck do
      it 'be initial' do
        expect(neighborhood_card_in_game).to be_in_deck
      end
    end

    describe :wait_draw do
      it 'move to waiting_draw state' do
        expect{
          neighborhood_card_in_game.wait_draw
          expect(neighborhood_card_in_game).to be_valid
        }.to change {
          neighborhood_card_in_game.state
        }.from("in_deck").to("waiting_draw")
      end
    end

    describe "#get_back_in_deck" do

      let(:neighborhood_card_in_game) {
        NeighborhoodCardInGame.new(:state => :waiting_draw)
      }

      it 'move from :waiting_draw state' do
        expect{
          neighborhood_card_in_game.get_back_in_deck
        }.to change {
          neighborhood_card_in_game.state
        }.from("waiting_draw").to("visible_in_deck")
      end

      context "from :in_deck" do
        let(:neighborhood_card_in_game) {
          NeighborhoodCardInGame.new
        }

        it 'state failed' do
          expect {
            neighborhood_card_in_game.get_back_in_deck
          }.to_not change { neighborhood_card_in_game.state }
        end
      end
    end

    describe "#get_in_player_hand" do

      let(:neighborhood_card_in_game) {
        NeighborhoodCardInGame.new(:state => 'waiting_draw')
      }

      it 'move from :in_player_hand state' do
        expect{
          neighborhood_card_in_game.get_in_player_hand
        }.to change {
          neighborhood_card_in_game.state
        }.from("waiting_draw").to("in_player_hand")
      end

      context "from :in_deck" do
        let(:neighborhood_card_in_game) {
          NeighborhoodCardInGame.new
        }

        it 'state failed' do
          expect {
            neighborhood_card_in_game.get_in_player_hand
          }.to_not change { neighborhood_card_in_game.state }
        end
      end
    end

  end

  describe "#player=" do
    it 'define player own this card' do
      expect {
        neighborhood_card_in_game.player = player_in_game
      }.to change {
        neighborhood_card_in_game.player_in_game_id
      }.from(nil).to(player_in_game.id)
    end
  end

end
