# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'json'
require './models/player'
require './models/game'

# Database configuration
set :database_file, 'config/database.yml'

# Basic configuration
set :bind, '0.0.0.0'
set :port, 4567

# Sample GET endpoint
get '/' do
  json message: 'Welcome to the Sinatra API!'
end

# User endpoints
get '/users' do
  json User.all
end

get '/users/:id' do
  user = User.find_by(id: params[:id])
  if user
    json user
  else
    status 404
    json error: 'User not found'
  end
end

post '/users' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  user = User.new(data)

  if user.save
    status 201
    json user
  else
    status 422
    json errors: user.errors.full_messages
  end
end

# Sample POST endpoint
post '/data' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  json received: data
end

# Sample GET endpoint with parameters
get '/hello/:name' do
  json message: "Hello, #{params['name']}!"
end

# Sample GET endpoint with parameters
get '/test-endpoint' do
  content_type :json
  { message: 'TEST ENDPOINT!' }.to_json
end

# Player Routes

# List all players
get '/players' do
  players = Player.all
  json players
end

# Show a specific player
get '/players/:id' do
  player = Player.find_by(id: params[:id])
  if player
    json player
  else
    status 404
    json error: 'Player not found'
  end
end

# Create a new player
post '/players' do
  player = Player.new(params)
  if player.save
    status 201
    json player
  else
    status 422
    json errors: player.errors.full_messages
  end
end

# Update a player
put '/players/:id' do
  player = Player.find_by(id: params[:id])
  if player&.update(params)
    json player
  else
    status 404
    json error: 'Player not found or update failed'
  end
end

# Delete a player
delete '/players/:id' do
  player = Player.find_by(id: params[:id])
  if player&.destroy
    status 204
  else
    status 404
    json error: 'Player not found'
  end
end

# Game Routes

# List all games
get '/games' do
  games = Game.all
  json games
end

# Show a specific game
get '/games/:id' do
  game = Game.find_by(id: params[:id])
  if game
    json game
  else
    status 404
    json error: 'Game not found'
  end
end

# Create a new game
post '/games' do
  player_one = Player.find_by(id: params[:player_one_id])
  player_two = Player.find_by(id: params[:player_two_id])
  if player_one && player_two
    game = Game.create_game(player_one, player_two)
    status 201
    json game
  else
    status 422
    json error: 'Invalid players'
  end
end

# Update a game
put '/games/:id' do
  game = Game.find_by(id: params[:id])
  if game&.update(params)
    json game
  else
    status 404
    json error: 'Game not found or update failed'
  end
end

# Delete a game
delete '/games/:id' do
  game = Game.find_by(id: params[:id])
  if game&.destroy
    status 204
  else
    status 404
    json error: 'Game not found'
  end
end

# New game route
get '/games/new/' do
  # You can return a JSON response with instructions or a template
  json message: 'To create a new game, POST to /games with player_one_id and player_two_id'
end
