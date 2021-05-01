#frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coin, type: :model do
  describe '#validations' do
  	let(:coin) { build(:coin) }

	it 'tests that factory is valid' do
	  expect(coin).to be_valid # coin.valid? => true
	end

	it 'has an invalid name' do
	  coin.name = ''
	  expect(coin).not_to be_valid
	  expect(coin.errors[:name]).to include("can't be blank")
  	end 
  end
end
