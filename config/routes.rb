Rails.application.routes.draw do
  resources :artworks

  devise_for :accounts
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
