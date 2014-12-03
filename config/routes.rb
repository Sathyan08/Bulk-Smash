Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    member do
      get 'request', to: 'friendships#send_request'
      get 'accept', to: 'friendships#accept_request'
      get 'remove_friendship', to: 'friendships#destroy'
    end
    resources :lists, only: [:show, :edit, :update, :destroy] do
      resources :list_items, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :lists, only: [:new, :create]
  resources :foods
  resources :units

  root 'static_pages#home'
end
