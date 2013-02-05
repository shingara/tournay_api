require 'spec_helper'

describe GamesController do

  let(:game) { Game.new }

  describe "POST /games/start" do
    before do
      post :start, :num_player => 2
    end

    it { expect(response.status).to eq 201 }
    it { expect(response).to render_template('games/show') }
  end

  describe "GET /games/:id" do

    let(:req) {
      get :show, :id => game_id
    }

    context "with a game exist" do
      let(:game_id) { game.id }
      before do
        Game.stub(:find).with(game.id.to_s).and_return(game)
        req
      end
      it { expect(response.status).to eq 200 }
      it { expect(response).to render_template('games/show') }
    end

    context "without game exist" do
      let(:game_id) { '123' }
      before { req }
      it { expect(response.status).to eq 404 }
    end
  end

end
