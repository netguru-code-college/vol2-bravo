Rails.application.routes.draw do

  root 'dashboard#index'

  scope '/profile' do
    resources :users, only: [:edit, :update, :destroy] do
      resources :cooks, only: [:show, :new, :create, :edit, :update, :destroy]
    end
  end
  
  devise_for :users
end
