#frozen_string_literal: true

class Coin < ApplicationRecord
  validates :name, presence: true
  validates :ticker, presence: true
  validates :price, presence: true

  scope :recent, -> { order(created_at: :desc) }
  def to_param
  	"#{id}-#{ticker}"
  end
end
