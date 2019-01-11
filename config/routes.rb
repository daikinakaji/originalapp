Rails.application.routes.draw do
  get 'profiles/index'
  root 'pages#index'
  resources :users
  resources :blogs
  get "/login", to: "sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"
  get "/blogs", to: "blogs#index"
  get "/profiles", to: "profiles#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
