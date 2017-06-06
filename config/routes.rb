Rails.application.routes.draw do
  devise_for :users
  root 'rooms#index'
  resources :users, shallow: true do
    resources :rooms do
      resources :information
      resources :prices
      resources :locations
    end
  end
end
