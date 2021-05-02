require 'rails_helper'

RSpec.describe CoinsController do
  describe '#index' do
    it 'returns a success response' do
      get '/coins'
      # expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
    end

    it 'returns coins in the proper order' do
      older_coin = create(:coin, created_at: 1.hour.ago)
      recent_coin = create(:coin)
      get '/coins'
      ids = json_data.map { |item| item[:id].to_i }
      expect(ids).to(
        eq([recent_coin.id, older_coin.id])
      )
    end
  end
end