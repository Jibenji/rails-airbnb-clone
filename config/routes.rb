Rails.application.routes.draw do
  devise_for :accounts, controllers: { registrations: "registrations" }
  resources :users, except: [:create, :new]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
