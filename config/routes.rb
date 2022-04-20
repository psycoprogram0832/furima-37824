Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :oders, only: :create
  end
  root to: 'items#index'  
end
