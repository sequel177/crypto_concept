FactoryBot.define do
  factory :coin do
    name { "Sample name" }
    ticker { "Sample ticker" }
    price { "Sample price" }
  end

  factory :random_coin, class: Coin do
  	name { Faker::CryptoCoin.coin_name }
    ticker { Faker::CryptoCoin.acronym }
    price { Faker::Commerce.price(range: 0..10.0, as_string: true) }
  end
end
