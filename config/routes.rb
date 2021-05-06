Rails.application.routes.draw do
  get 'schools/new'
  get 'favorites/create'
  root 'pages#index'
  get 'sessions/new'
  post '/login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'
  put '/edit/haiku',to:'haikus#update'
  get '/haikus/:id/edit',to:'haikus#edit',as: 'edit_haikus'
  get 'haikus/search'
  post '/favorites',to: "favorites#create"
  get 'users/favorite_haiku'
  get 'haikus/favorite_haiku'
  get 'users/sort/:id',to:'users#sort',as: 'sort_users'
  get '/sort',to:'pages#sort',as:'sort_pages'
  get 'schools/search'

  # get "users/:id", to: "users#show", as: "user_path"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages
  resources :users
  resources :haikus
  resources :comments
  resources :favorites
  resources :schools
end
