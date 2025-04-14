require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'json'

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