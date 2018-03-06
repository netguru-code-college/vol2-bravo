Rails.application.routes.draw do

  root 'dashboard#index'

  scope '/profile' do
    resources :users,   only: [:edit, :update, :destroy] do
      resources :cooks, only: [:show, :new, :create, :edit, :update, :destroy]
    end
    resources :organizations, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :proposals,   only: [:new, :create, :show, :edit, :update, :destroy, :index]
    end
    get  '/custom_orders/:proposal_id/new', to: 'custom_orders#new',    as: 'custom_order'
    post '/custom_orders/:proposal_id',     to: 'custom_orders#create', as: 'custom_orders'
  end

  devise_for :users

  resources :cooks do
    resources :dishes
  end

  resources :ingredients

  resources :relationships,       only: [:create, :destroy]
  resources :cooks_organizations, only: [:create, :destroy]
end
