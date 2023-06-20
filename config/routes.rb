Rails.application.routes.draw do
  get '/sessions/new'
  root to: 'home#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  resources :consultas
  resources :pacientes, only: [:new, :create, :show, :edit, :update]
  resources :medicos, only: [:new, :create, :show, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
