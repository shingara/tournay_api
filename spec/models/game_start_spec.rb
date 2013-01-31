require_relative '../../app/models/game_start'

describe GameStart do

  let(:game_start) { GameStart.new(2) }
  let(:game) {
    game_class = Struct.new(:save)
    game_class.new(true)
  }

  describe "#create" do
    it { expect(game_start.create).to eq true }
    it 'create a game' do
      Game.should_receive(:new).with(:num_player => 2).and_return(game)
      game_start.create
    end
  end

end
