# frozen_string_literal: true

class CoinsController < ApplicationController

  def index
  	coins = Coin.recent
  	paginated = paginator.call(
  	  coins,
  	  params: pagination_params,
  	  base_url: request.url
  	)

  	options = { meta: paginated.meta.to_h, links: paginated.links.to_h }
  	render json: serializer.new(paginated.items, options), status: :ok
  end

  def serializer
    CoinSerializer
  end

  def paginator
  	JSOM::Pagination::Paginator.new
  end

  def pagination_params
    params[:page] ? params.require(:page).permit! : { number: 1, size: 3 }
  end
end