require 'fabricators/game_fabricator'
require 'spec_helper'

describe Game::AddPlayer do
  let(:game) { GameFabricator.new.create }
  let(:add_player) {
    Game::AddPlayer.new(
      game,
      {
        :name => 'Cyril',
        :external_id => '3'
      }
    )
  }
  describe "#execute" do
    it 'add a player to game' do
      expect{
        add_player.execute
      }.to change{
        game.player_in_game.count
      }.by(1)
    end

    context "player" do
      before { add_player.execute }
      subject{ add_player.player }
      it { should be_a(PlayerInGame) }
      it { should be_persisted }
      its(:denier) { should eq 6 }
      its(:citizens) { should have(6).items }
      it 'have 2 red citizens' do
        expect(subject.citizens.select{|ci| ci.color == Color.new(:red)}).to have(2).items
      end

      it 'have 2 yellow citizens' do
        expect(subject.citizens.select{|ci| ci.color == Color.new(:yellow)}).to have(2).items
      end

      it 'have 2 white citizens' do
        expect(subject.citizens.select{|ci| ci.color == Color.new(:white)}).to have(2).items
      end
    end

    it 'return true if save' do
      expect(add_player.execute).to eq true
    end

    it 'set valid name' do
      add_player.execute
      expect(game.player_in_game.first.name).to eq 'Cyril'
    end

    it 'set valid external_id' do
      add_player.execute
      expect(game.player_in_game.first.external_id).to eq '3'
    end

    it 'save a new history' do
      expect{
        add_player.execute
      }.to change{
        game.histories.count
      }.by(1)
    end

    context "history create" do
      before(:all) do
        add_player.execute
      end
      it { expect(game.histories.last.action).to eq 'add_player' }
      it { expect(game.histories.last.params).to eq(
        {:name => 'Cyril', :external_id => '3'}
      ) }
    end

    context "with player missing" do
      it 'change the num of game_status' do
        expect {
          add_player.execute
        }.to change {
          game.status.num
        }.from(2).to(1)
      end

      it 'not change the game status' do
        add_player.execute
        expect(game.status.waiting_new_player?).to be true
      end
    end

    context "with already all player create" do
      before do
        game.player_in_game.build({:name => 'foo', :external_id => '1'})
        game.player_in_game.build({:name => 'bar', :external_id => '2'})
        game.save!
      end
      it 'not add new player' do
        expect(add_player.execute).to eq false
        expect(game.player_in_game.count).to eq 2
      end
    end

    context "on last player add" do
      before do
        game.player_in_game.build({:name => 'foo', :external_id => '1'})
        game.save!
      end

      it 'change status to waiting player' do
        add_player.execute
        expect(game.status.waiting_player?).to eq true
      end

    end
  end
end
