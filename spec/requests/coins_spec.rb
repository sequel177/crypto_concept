require 'rails_helper'

RSpec.describe CoinsController do
  describe '#index' do
    it 'returns a success resopnse' do
      get '/coins'
      # expect(response.status).to eq(200)
      expect(response).to have_http_status(:ok)
    end

    it 'returns a proper JSON' do
      coin = create :coin
      get '/coins'
      expect(json_data.length).to eq(1)
      expected = json_data.first
      aggregate_failures do
        expect(expected[:id]).to eq(coin.id.to_s)
        expect(expected[:type]).to eq('coin')
        expect(expected[:attributes]).to eq(
          name: coin.name,
          ticker: coin.ticker,
          price: coin.price,
          slug: coin.slug
        )
      end
    end
  end
end