Rails.application.routes.draw do
  
  resources :users, only: [:edit, :update, :destroy] do
    resources :cooks, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'dashboard/index'
end
