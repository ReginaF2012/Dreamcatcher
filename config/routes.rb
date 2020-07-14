Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'dreams#index'
  resources :users, only: [:show, :create] do
    resources :dreams do
      resources :dream_symbolisms, only: [:new, :create, :edit, :destroy]
    end
  end
  resources :dream_symbolisms, only: [:update]
  resources :dreams, only: [:index]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
end
