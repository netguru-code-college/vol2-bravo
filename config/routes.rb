Rails.application.routes.draw do

  root 'dashboard#index'

  scope '/profile' do
    resources :users, only: [:edit, :update, :destroy] do
      resources :cooks, only: [:show, :new, :create, :edit, :update, :destroy]
      resources :organizations, only: [:new, :create, :show, :edit, :update, :delete]
    end
  end

  devise_for :users
end
