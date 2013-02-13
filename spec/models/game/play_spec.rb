require 'spec_helper'

describe Game::Play do
  let(:game) {
    Game.new(
      :player_in_game => [
        PlayerInGame.new(:external_id => 3),
        PlayerInGame.new(:external_id => 4)
      ],
      :status => GameStatus.new(:state => 'waiting_player', :num => 2)
    )
  }

  let(:game_play) {
    Game::Play.new(game, params)
  }

  describe "#play" do

    context "with bad player to play" do
      let(:params) { {'player_id' => 3 } }
      it { expect(game_play.play).to eq false }
    end

    context "with get_card action" do
      context "without all params" do
        let(:params) { {'player_id' => 4, :action => 'get_card' } }
        it { expect(game_play.play).to eq false }
      end
    end
  end

  describe "#error" do
    before do
      game_play.play
    end
    context "with bad player to play" do
      let(:params) { {'player_id' => 3 } }
      it { expect(game_play.errors).to eq ['bad_player_to_play'] }
    end

    context "with get_card action" do
      context "without all params" do
        let(:params) { {'player_id' => 4, :action => 'get_card' } }
        it { expect(game_play.errors).to eq ['not_all_args'] }
      end
    end
  end
end
