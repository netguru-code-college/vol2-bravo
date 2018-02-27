Rails.application.routes.draw do

  root 'dashboard#index'

  resources :users, only: [:edit, :update, :destroy] do
    resources :cooks, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  
  devise_for :users
end
