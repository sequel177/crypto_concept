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
      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body).to eq(
        data: [
          {
            id: coin.id.to_s,
            type: 'coin',
            attributes: {
              name: coin.name,
              ticker: coin.ticker,
              price: coin.price,
              slug: coin.slug
            }
          }
        ]
      )
    end
  end
end