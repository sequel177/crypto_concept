require 'rails_helper'

RSpec.describe CoinName, type: :model do
  it 'tests CoinName object' do
  	CoinName = CoinName.create({acronym: 'Sample acronym', price: 'Sample price'})
  end
end
