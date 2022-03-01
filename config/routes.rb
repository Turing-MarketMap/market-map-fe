Rails.application.routes.draw do
  get '/listings', to: 'listings#search'


  root 'dashboard#index'
  get '/profile', to: 'user#show'
  resources :listings, only: %i[show]
end
