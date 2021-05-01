#frozen_string_literal: true

class Coin < ApplicationRecord
  validates :name, presence: true
  validates :ticker, presence: true
  validates :price, presence: true
  validates :slug, presence: true, uniqueness: true
end
