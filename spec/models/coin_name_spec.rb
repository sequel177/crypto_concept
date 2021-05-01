require 'rails_helper'

RSpec.describe CoinName, type: :model do
  it 'tests CoinName object' do
  	#CoinName = CoinName.create({acronym: 'Sample acronym', price: 'Sample price'})
  	coin_name = FactoryBot.create(:coin_name)
  	expect(CoinName.acronym).to eq('Sample acronym')
  end
end
