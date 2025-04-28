require 'spec_helper'

RSpec.describe ResponseHelper do
  describe '.json_response' do
    it 'returns a JSON response with the correct status and body' do
      response = ResponseHelper.json_response({ message: 'Success' }, 200)
      expect(response[0]).to eq(200)
      expect(response[1]['Content-Type']).to eq('application/json')
      expect(JSON.parse(response[2][0])).to eq({ 'message' => 'Success' })
    end
  end

  describe '.error_response' do
    it 'returns an error response with the correct status and message' do
      response = ResponseHelper.error_response('Not Found', 404)
      expect(response[0]).to eq(404)
      expect(JSON.parse(response[2][0])).to eq({ 'error' => 'Not Found' })
    end
  end
end
