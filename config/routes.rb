Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :users, only: [:new, :edit, :update]
end
