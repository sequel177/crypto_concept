Rails.application.routes.draw do
  # get '/coins', to: 'coins#index'
  resources :coins, only: [:index, :show]
end
