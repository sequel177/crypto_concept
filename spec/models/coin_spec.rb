#frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coin, type: :model do
  describe '#validations' do
  end

  describe '.recent' do
    it 'returns coins in the correct order' do
      older_coin =
        create(:coin, created_at: 1.hour.ago)
      recent_coin = create(:coin)

      expect(described_class.recent).to eq(
        [recent_coin, older_coin]
      )

      recent_coin.update_column(:created_at, 2.hours.ago)

      expect(described_class.recent).to eq(
        [older_coin, recent_coin]
      )
    end
  end

  describe 'to_param' do
    let!(:coins) do
      create_list :coin, 3
    end
    it 'returns a unique identifier' do
      expect(Coin.all.collect { |c| c.to_param }.uniq.size).to eq 3
    end
  end  
end
