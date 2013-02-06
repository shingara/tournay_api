require 'fabricators/game_fabricator'
require 'spec_helper'

describe GameApiDecorator do
  let(:game) { GameFabricator.new.create }
  let(:game_decorator) { GameApiDecorator.new(game) }

  describe "#links" do
    it 'have self link' do
      expect(game_decorator.links['self']).to eq({'href' => "http://test.host/games/#{game.id}"})
    end

    it 'have add_player link' do
      expect(game_decorator.links['add_player']).to eq({'href' => "http://test.host/games/#{game.id}/add_player", 'method' => 'post', 'params' => ['name', 'id']})
    end
  end

end
