require 'fabricators/game_fabricator'
require 'models/spec_helper'

describe Game do

  let(:game_status) {
    GameStatus.new(:state => 'waiting_player', :num => 2)
  }
  let(:player_in_game) { PlayerInGame.new(:external_id => 4) }
  let(:game) {
    Game.new(
      :player_in_game => [
        PlayerInGame.new(:external_id => 3),
        player_in_game
      ],
      :status => game_status
    )
  }

  it { should have_field(:num_player).of_type(Integer) }

  it { should embed_many(:player_in_game) }
  it { should embed_many(:neighborhood_card).of_type(NeighborhoodCardInGame) }
  it { should embed_many(:event_cards_in_game).of_type(EventCardInGame) }
  it { should embed_many(:citizens).of_type(Citizen) }
  it { should embed_many(:histories).of_type(GameHistory) }
  it { should embed_one(:status).of_type(GameStatus) }

  it { expect(Game.new(:num_player => 1)).to_not be_valid }
  it { expect(GameFabricator.new.create).to be_valid }
  it 'not valid without game_status' do
    expect(Game.new(:status => nil)).to_not be_valid
  end

  describe "#current_player_waiting" do
    context "with game_status waiting new player" do
      let(:game_status) { GameStatus.new(:state => 'waiting_new_player', :num => 2) }
      it { expect(game.current_player_waiting).to eq nil }
    end

    context "with game_status waiting player" do
      let(:game_status) { GameStatus.new(:state => 'waiting_player', :num => 2) }
      it { expect(game.current_player_waiting).to eq player_in_game }
    end
  end

  describe "#neighborhood_card_of(color, level)" do
    context "with card of this color and level" do
      let(:neighborhood_card) {
        NeighborhoodCardInGame.new(:color => Color.new(:white), :level => 2)
      }
      let(:game) {
        Game.new(:neighborhood_card => [
          neighborhood_card,
          NeighborhoodCardInGame.new(:color => Color.new(:white), :level => 3),
          NeighborhoodCardInGame.new(:color => Color.new(:red), :level => 2),
        ])
      }
      it 'return array with the card' do
        expect(game.neighborhood_card_of(Color.new(:white), 2)).to eq [neighborhood_card]
      end
    end

    context "without card of this color and level" do
      let(:game) {
        Game.new(:neighborhood_card => [
          NeighborhoodCardInGame.new(:color => Color.new(:white), :level => 3),
          NeighborhoodCardInGame.new(:color => Color.new(:red), :level => 2),
        ])
      }
      it 'return empty array' do
        expect(game.neighborhood_card_of(Color.new(:white), 2)).to eq []
      end
    end
  end
end
