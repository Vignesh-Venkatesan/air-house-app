Rails.application.routes.draw do

  resources :accounts
  resources :sessions, only: [:new, :create, :destroy]

  root  'main_pages#home'

  match '/home',              to: 'main_pages#home',          via: 'get'

  match '/houses/search',     to: 'houses#search',            via: 'post'
  match '/houses/hostlist',   to: 'houses#hostlist',          via: 'get'
  
  match '/bookings/create',   to: 'bookings#create',         via: 'get'
  match '/bookings/booklist', to: 'bookings#booklist',        via: 'get'

  match '/signup',            to: 'accounts#signup',          via: 'get'

  match '/login',             to: 'sessions#login',           via: 'get'
  match '/logout',            to: 'sessions#destroy',         via: 'delete'

  # Routes for Google authentication
  get 'auth/google/callback',     to: 'sessions#googleAuth'
  get 'auth/failure',             to: 'sessions#login'

  resources :houses
  resources :bookings

end