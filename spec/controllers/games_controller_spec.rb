require 'spec_helper'

describe GamesController do

  describe "POST /games/start" do
    before do
      post :start, :num_player => 2
    end

    it { expect(response.status).to eq 201 }
    it { expect(response).to render_template('games/show') }
  end

end
