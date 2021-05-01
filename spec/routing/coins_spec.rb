require 'rails_helper'

RSpec.describe '/coins routes' do
  it 'routes to coins#index' do
  	# expect(get '/coins').to route_to(controller: 'coins', action: 'index')
  	aggregate_failures do
  	  expect(get('/coins')).to route_to('coins#index')
  	  expect(get('/coins?page[number]=3')).to route_to('coins#index', page: { 'number' => '3' })
  	end
  end 
end