Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    member do
      get 'request', to: 'friendships#send_request'
      get 'accept', to: 'friendships#accept_request'
      get 'remove_friendship', to: 'friendships#destroy'
    end
  end

  resources :lists do
    resources :list_items
  end

  resources :foods
  resources :units
  resources :bulks

  root 'static_pages#home'
end
