Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'
  resources :users, only: [:show, :create] do
    resources :dreams
  end
  resources :dream_symbolisms
  resources :dreams, only: [:show, :index]
  get '/add-symbols', to: 'dream_symbolisms#new'
  post '/add-symbols', to: 'dreams#add_symbolisms'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
