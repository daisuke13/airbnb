Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :users, only: [:edit, :show]
end
