Rails.application.routes.draw do

  root 'dashboard#index'

  scope '/profile' do
    resources :users, only: [:edit, :update, :destroy] do
      resources :cooks, only: [:show, :new, :create, :edit, :update, :destroy]
    end
    resources :organizations, only: [:new, :create, :show, :edit, :update, :delete]
  end

  devise_for :users

  resources :cooks do
    resources :dishes
  end
end
