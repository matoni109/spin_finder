Rails.application.routes.draw do
  get 'users/show'
  get 'dashboard/index'
  devise_for :users
  root to: 'pages#home' # landing page => bike show

  resources :bikes do
    resources :bookings, only: [:new, :create ]
  end

  resources :reviews, only: [ :show, :update, :destroy ]
  resources :bookings, only: [ :show, :update, :destroy, :edit ] do
    resources :reviews, only: [:new, :create ]
  end

  post 'bookings/:id/accept', to: 'bookings#accept', as: :accept_booking
  post 'bookings/:id/deny', to: 'bookings#deny', as: :deny_booking
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #   get 'reviews/show'
  # get 'bookings/show'
  # get 'bikes/index'
  # get 'bikes/show'
  get 'user/:id', to: 'users#show', as: :profile
  get '/dashboard', to: 'pages#dashboard'
end
