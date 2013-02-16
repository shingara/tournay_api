require 'models/spec_helper'

describe PlayerInGame do

  let(:player_in_game) {
    PlayerInGame.new(
      :citizens => [
        Citizen.new(:color => Color.new(:red), :engaged => false),
        Citizen.new(:color => Color.new(:red), :engaged => false),
        Citizen.new(:color => Color.new(:white), :engaged => false),
        Citizen.new(:color => Color.new(:white), :engaged => false),
      ]
    )
  }

  it { should have_field(:point).of_type(Integer) }
  it { should have_field(:denier).of_type(Integer) }
  it { should have_field(:external_id) }
  it { should have_field(:name).of_type(String) }

  it { should be_embedded_in(:game) }

  it { should embed_many(:citizens).of_type(Citizen) }

  it { should embed_many(:neighborhood_cards).of_type(NeighborhoodCardInGame) }
  it { should embed_many(:event_cards).of_type(EventCardInGame) }

  describe "#event_cards_in_hand" do

    let(:event_card_played) { EventCardInGame.new(:play => true) }
    before do
      player_in_game.event_cards << event_card_played
    end

    context "with event cards in hand" do
      let(:event_card_in_hand) { EventCardInGame.new(:play => false) }
      before do
        player_in_game.event_cards << event_card_in_hand
      end
      it { expect(player_in_game.event_cards_in_hand).to eq [event_card_in_hand] }
    end

    context "without event cards in hand" do
      it { expect(player_in_game.event_cards_in_hand).to eq [] }
    end
  end
  describe "#neighborhood_cards_in_hand" do

    let(:neighborhood_card_played) { NeighborhoodCardInGame.new(:play => true) }
    before do
      player_in_game.neighborhood_cards << neighborhood_card_played
    end

    context "with neighborhood cards in hand" do
      let(:neighborhood_card_in_hand) { NeighborhoodCardInGame.new(:play => false) }
      before do
        player_in_game.neighborhood_cards << neighborhood_card_in_hand
      end
      it { expect(player_in_game.neighborhood_cards_in_hand).to eq [neighborhood_card_in_hand] }
    end

    context "without neighborhood cards in hand" do
      it { expect(player_in_game.neighborhood_cards_in_hand).to eq [] }
    end
  end

  describe "#event_cards_in_place" do

    let(:event_card_in_hand) { EventCardInGame.new(:play => false) }
    before do
      player_in_game.event_cards << event_card_in_hand
    end

    context "with event cards in place" do
      let(:event_card_in_place) { EventCardInGame.new(:play => true) }
      before do
        player_in_game.event_cards << event_card_in_place
      end
      it { expect(player_in_game.event_cards_in_place).to eq [event_card_in_place] }
    end

    context "without event cards in place" do
      it { expect(player_in_game.event_cards_in_place).to eq [] }
    end
  end
  describe "#neighborhood_cards_in_place" do

    let(:neighborhood_card_in_hand) { NeighborhoodCardInGame.new(:play => false) }
    before do
      player_in_game.neighborhood_cards << neighborhood_card_in_hand
    end

    context "with neighborhood cards in place" do
      let(:neighborhood_card_in_place) { NeighborhoodCardInGame.new(:play => true) }
      before do
        player_in_game.neighborhood_cards << neighborhood_card_in_place
      end
      it { expect(player_in_game.neighborhood_cards_in_place).to eq [neighborhood_card_in_place] }
    end

    context "without neighborhood cards in place" do
      it { expect(player_in_game.neighborhood_cards_in_place).to eq [] }
    end
  end

  describe "#citizens_reader_in(color)" do
    let(:player_in_game) {
      PlayerInGame.new(
        :citizens => [
          Citizen.new(:color => Color.new(:red), :engaged => true),
          Citizen.new(:color => Color.new(:red), :engaged => false),
          Citizen.new(:color => Color.new(:red), :engaged => false),
          Citizen.new(:color => Color.new(:white), :engaged => false),
        ]
      )
    }
    it 'return the number' do
      expect(player_in_game.citizens_ready_in(Color.new(:red))).to eq 2
    end
  end

  describe "#engaged_citizens" do
    it 'engaged the number of citizens in this color' do
      expect {
        player_in_game.engaged_citizens(Color.new(:white), 2)
      }.to change {
        player_in_game.citizens_ready_in(Color.new(:white))
      }.by(-2)
    end
    it 'not engaged citizens in other color' do
      expect {
        player_in_game.engaged_citizens(Color.new(:white), 2)
      }.to_not change {
        player_in_game.citizens_ready_in(Color.new(:red))
      }
    end
  end
end
