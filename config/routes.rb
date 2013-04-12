TournayApi::Application.routes.draw do
  post '/games/start' => 'games#start'
  get '/games/:id' => 'games#show', :as => 'game'
  get '/games/:id/can_play' => 'games#can_play', :as => 'can_play_game'
  post '/games/:id/add_player' => 'games#add_player', :as => 'add_player_game'
  post '/games/:id/play' => 'games#play', :as => 'play_game'
end
