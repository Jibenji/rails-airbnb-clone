Rails.application.routes.draw do
  resources :artworks

  devise_for :accounts, controllers: { registrations: "registrations" }

  resources :users, only: [:edit, :update], path: :editprofile
  resources :users, only: [:show], path: :profile

  get 'editprofile', to: 'users#edit'
  patch 'editprofile', to: 'users#update'

  get 'profile', to: 'users#show'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
