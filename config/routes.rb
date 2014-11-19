Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    member do
      get 'request', to: 'requests#send_request'
      get 'accept', to: 'requests#accept_request'
    end
  end

  root 'static_pages#home'
end
