Rails.application.routes.draw do

  root 'dashboard#index'

  scope '/profile' do
    resources :users, only: [:edit, :update, :destroy] do
      resources :cooks, only: [:show, :new, :create, :edit, :update, :destroy]
    end
    resources :organizations, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :proposals, only: [:new, :create, :show, :edit, :update, :destroy, :index]
    end
  end

  devise_for :users

  resources :cooks do
    resources :dishes
  end

  resources :ingredients

  resources :relationships, only: [:create, :destroy]
end
