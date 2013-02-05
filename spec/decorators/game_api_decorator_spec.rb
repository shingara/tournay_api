require 'fabricators/game_fabricator'
require 'spec_helper'

describe GameApiDecorator do
  let(:game) { GameFabricator.new.create }
  let(:game_decorator) { GameApiDecorator.new(game) }

  describe "#links" do
    it 'have self link' do
      expect(game_decorator.links['self']).to eq "http://test.host/games/#{game.id}"
    end
  end

end
