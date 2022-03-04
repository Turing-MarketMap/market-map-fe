Rails.application.routes.draw do
  root 'dashboard#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'
  delete '/users', to: 'users#destroy'

  resources :user_listings, only: [:create, :destroy]

  resources :listings, only: %i[show]
end
