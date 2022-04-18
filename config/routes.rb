Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :new,:create,:show, :edit, :update] 
  root to: 'items#index'  
  resources :users, onry: [:show]
end
