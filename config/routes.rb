Rails.application.routes.draw do
  root "dashboard#index"

  #resources :users, only: [:index]
  get '/users', to: 'users#index'
end
