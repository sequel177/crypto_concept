# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoinsController do
  describe '#index' do
    it 'returns a success response' do
      get '/coins'
      #expect(response.status).to eq(200)
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
          price: coin.price
        )
      end
    end

    it 'returns articles in the proper order' do
      older_coin =
        create(:coin, created_at: 1.hour.ago)
      recent_coin = create(:coin)
      get '/coins'
      ids = json_data.map { |item| item[:id].to_i }
      expect(ids).to(
        eq([recent_coin.id, older_coin.id])
      )
    end

    it 'paginates results' do
      coin1, coin2, coin3 = create_list(:coin, 3)
      get '/coins', params: { page: { number: 2, size: 1 } }
      expect(json_data.length).to eq(1)
      expect(json_data.first[:id]).to eq(coin2.id.to_s)
    end

    it 'contains pagination links in the response' do
      coin1, coin2, coin3 = create_list(:coin, 3)
      get '/coins', params: { page: { number: 2, size: 1 } }
      expect(json[:links].length).to eq(5)
      expect(json[:links].keys).to contain_exactly(
        :first, :prev, :next, :last, :self
      )
    end
  end
end