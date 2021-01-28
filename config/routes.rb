Rails.application.routes.draw do
  root 'pages#index'
  get 'sessions/new'
  post '/login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'

  # get "users/:id", to: "users#show", as: "user_path"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages
  resources :users
  resources :haikus
end
