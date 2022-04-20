Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :orders, only: [:create, :index, :new]
  end
  root to: 'items#index'  
end
