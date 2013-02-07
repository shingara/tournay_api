# encoding: utf-8
require 'spec_helper'

describe "Play" do
  it "can play", :pending => true do
    # Start game
    post "/games/start", :num_player => 2
    game_links = JSON.parse(response.body)['links']

    # Get information about this game
    get game_links['self']['href']
    expect(JSON.parse(response.body)['status']).to eq I18n.t('game_status.state.waiting_player', :count => 2)

    # Add player 1
    post game_links['add_player']['href'], 'name' => 'Cyril', :external_id => '3'
    expect(response.status).to eq 201
    game = JSON.parse(response.body)
    expect(game['players']).to eq [
      {'name' => 'Cyril', 'id' => '3'}
    ]
    expect(game['status']).to eq I18n.t('game_status.state.waiting_player', :count => 1)

    # Add player 2
    post game_links['add_player']['href'], {'name' => 'Léna', :external_id => '4'}
    expect(response.status).to eq 201
    game = JSON.parse(response.body)
    expect(game['players']).to eq [
      {'name' => 'Cyril', 'id' => '3'},
      {'name' => 'Léna', 'id' => '4'}
    ]
    expect(game['status']).to eq 'waiting player 1 to play'
  end
end
