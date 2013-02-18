require 'spec_helper'
require 'database_cleaner'

describe GameStart do
  before(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    require_relative '../../db/seeds.rb'
  end
  after(:all) do
    DatabaseCleaner.clean
  end

  let(:game_start) { GameStart.new(2) }
  let(:game) {
    game_class = Struct.new(:save)
    game_class.new(true)
  }

  describe "#create" do
    it { expect(game_start.create).to eq true }

    it 'create a game' do
      game_start.create
      expect(game_start.game).to be_persisted
    end

    it 'associate all neighborhood card' do
      game_start.create
      expect(game_start.game.neighborhood_cards_in_game.size).to eq (NeighborhoodCard.count)
    end

    it 'made game_status associate' do
      game_start.create
      expect(
        game_start.game.status.state
      ).to eq "waiting_new_player"
      expect(
       game_start.game.status.num
      ).to eq 2
    end

  end

end
