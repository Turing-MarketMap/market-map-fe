Rails.application.routes.draw do
  root 'dashboard#index'
  get '/profile', to: 'user#show'
  resources :listings, only: %i[show]
end
