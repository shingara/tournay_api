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
      it { expect(game.histories.last.params).to eq({:name => 'Cyril', :external_id => '3'}) }
    end

    context "with player missing" do
      it 'change the num of game_status' do
        expect {
          add_player.execute
        }.to change {
          game.status.num
        }.from(2).to(1)
      end
    end
  end
end
