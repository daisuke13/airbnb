Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :users, only: [:show, :edit, :update], shallow: true do
    resources :rooms, except: [:index, :destroy] do
      resources :information, only: [:new, :create]
      resources :prices, only: [:new, :create]
      resources :locations, only: [:new, :create]
      resources :bookings, only: [:create, :edit, :update]
    end
  end
end
