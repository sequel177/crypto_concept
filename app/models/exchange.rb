class Exchange < ApplicationRecord
  has_and_belongs_to_many :coins
end
