Rails.application.routes.draw do
  resources :artworks

  devise_for :accounts, controllers: { registrations: "registrations" }

  resources :users, only: [:edit, :update, :show], path: :profile

  get 'profile', to: 'users#edit'
  patch 'profile', to: 'users#update'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
