# frozen_string_literal: true

class CoinsController < ApplicationController
	include Paginable

  def index
  	paginated = paginate(Coin.recent)
  	render_collection(paginated)
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