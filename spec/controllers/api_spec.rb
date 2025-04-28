require 'spec_helper'

RSpec.describe 'API Endpoints' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /test-endpoint' do
    it 'returns a successful response' do
      get '/test-endpoint'
      expect(last_response).to be_ok
      expect(last_response.body).to eq('Test endpoint is working!')
    end
  end

  describe 'Player Endpoints' do
    let(:player_params) { { name: 'Test Player', score: 0 } }

    describe 'POST /players' do
      it 'creates a new player' do
        post '/players', player_params.to_json, 'CONTENT_TYPE' => 'application/json'
        expect(last_response).to be_ok
        response_data = JSON.parse(last_response.body)
        expect(response_data['name']).to eq('Test Player')
        expect(response_data['score']).to eq(0)
      end
    end

    describe 'GET /players/:id' do
      it 'returns a player' do
        player = create(:player)
        get "/players/#{player.id}"
        expect(last_response).to be_ok
        response_data = JSON.parse(last_response.body)
        expect(response_data['id']).to eq(player.id)
      end
    end
  end

  describe 'Game Endpoints' do
    let(:game_params) do
      {
        player_one_id: create(:player).id,
        player_two_id: create(:player).id
      }
    end

    describe 'POST /games' do
      it 'creates a new game' do
        post '/games', game_params.to_json, 'CONTENT_TYPE' => 'application/json'
        expect(last_response).to be_ok
        response_data = JSON.parse(last_response.body)
        expect(response_data['player_one_id']).to eq(game_params[:player_one_id])
        expect(response_data['player_two_id']).to eq(game_params[:player_two_id])
      end
    end
  end
end
