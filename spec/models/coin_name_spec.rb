require 'rails_helper'

RSpec.describe CoinName, type: :model do
  it 'tests coin object' do
  	#CoinName = CoinName.create({acronym: 'Sample acronym', price: 'Sample price'})
  	coin = FactoryBot.create(:coin_name)
  	expect(coin.acronym).to eq('Sample acronym')
  end
end
