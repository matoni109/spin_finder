Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: 'pages#home' # landing page => bike show

  resources :bikes do
    resources :bookings, only: [:new, :create ]
  end

  resources :reviews, only: [ :show, :update, :destroy ]
  resources :bookings, only: [ :show, :update, :destroy ] do
    resources :reviews, only: [:new, :create ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #   get 'reviews/show'
  # get 'bookings/show'
  # get 'bikes/index'
  # get 'bikes/show'
end
