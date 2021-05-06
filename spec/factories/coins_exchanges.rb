FactoryBot.define do
  factory :coins_exchange do
    coin { nil }
    exchange { "MyString" }
    references { "MyString" }
  end
end
