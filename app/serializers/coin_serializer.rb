class CoinSerializer
  include JSONAPI::Serializer
  attributes :name, :ticker, :price, :slug
end
