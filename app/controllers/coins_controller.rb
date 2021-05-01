# frozen_string_literal: true

class CoinsController < ApplicationController
  def index
  	coins = Coin.all
  	render json: serializer.new(coins), status: :ok
  end

  def serializer
    CoinSerializer
  end
end