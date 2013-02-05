# encoding: utf-8
require 'spec_helper'

describe "Play" do
  it "can play", :pending => true do
    post "/games/start", :num_player => 2
    game_links = JSON.parse(response.body)['links']

    get game_links['self']
    expect(JSON.parse(response.body)['status']).to eq 'waiting 2 player'

    post game_links['add_player'], :player => {'name' => 'Cyril', :id => '3'}
    expect(response.status).to eq 201

    get game_links['self']
    expect(JSON.parse(response.body)['status']).to eq 'waiting 1 player'

    post game_links['add_player'], :player => {'name' => 'Léna', :id => '4'}
    expect(response.status).to eq 201

    get game_links['self']
    expect(JSON.parse(response.body)['status']).to eq 'waiting player 1 to play'
  end
end
