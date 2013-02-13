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

  describe "POST /games/:id/play" do
    context "with valid action" do
      before do
        Game::Play.stub(:new).and_return(mock(:play => true, :game => game))
        post :play,
          :player_id => 3,
          :id => game.id,
          :action => 'get_card',
          :color => 'white',
          :level => 2
      end
      it { expect(response).to render_template('show') }
      it { expect(response.status).to eq 201 }
    end

    context "with error in play" do
      before do
        Game::Play.stub(:new).and_return(mock(:play => false, :game => game, :errors => ['bad action']))
        post :play,
          :player_id => 3,
          :id => game.id,
          :action => 'get_card',
          :color => 'white',
          :level => 2
      end
      it { expect(response.body).to eq ['bad action'].to_json }
      it { expect(response.status).to eq 400 }
    end
  end

end
