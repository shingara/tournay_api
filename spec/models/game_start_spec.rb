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
      expect(game_start.game.neighborhood_card.size).to eq (NeighborhoodCard.count)
    end

  end

end
