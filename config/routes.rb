Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    member do
      get 'request', to: 'friendships#send_request'
      get 'accept', to: 'friendships#accept_request'
      get 'remove_friendship', to: 'friendships#destroy'
    end

    resources :lists, only: [:new, :show, :edit, :destroy]
  end

  root 'static_pages#home'
end
