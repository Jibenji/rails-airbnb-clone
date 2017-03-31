Rails.application.routes.draw do

  get 'pages/thankyou', to: "pages#thankyou"

  resources :artworks

  devise_for :accounts, controllers: { registrations: "registrations" }

  resources :users, only: [:edit, :update], path: :editprofile
  resources :users, only: [:show], path: :profile do
    resources :purchases, only: [:index, :create, :new]
  end
  resources :users, only: [:index], path: :artists


  get 'editprofile', to: 'users#edit'
  patch 'editprofile', to: 'users#update'

  get 'profile', to: 'users#show'

  get 'artists', to: 'users#index'

  resources :artworks, only: [:sold], path: :artwork_sold

  patch 'artwork/sold', to: 'artworks#sold'




  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



