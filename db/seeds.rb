require 'faker'

100.times do
  name = Faker::CryptoCoin.coin_name
  coins = Coin.new(

  	name: name,
    ticker: Faker::CryptoCoin.acronym,
    price: Faker::Commerce.price(range: 0..10.0, as_string: true)
  	)

  coins.save
end