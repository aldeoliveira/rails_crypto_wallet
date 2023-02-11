Rails.application.routes.draw do
  get 'render/index'
  resources :mining_types
  get 'welcome/index' # , to: 'welcome#index'
  
  resources :coins
  # get '/coins', to: 'coins#index'
  # post '/coins', to: 'coins#create'
  # ...

  # root to: 'welcome#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'render#index'
end
