Rails.application.routes.draw do
  get '/sessions/new'
  root to: 'home#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  # Rotas para médicos
  get 'login_medico', to: 'sessions#new_medico'
  post 'login_medico', to: 'sessions#create_medico'
  delete 'sair_medico', to: 'sessions#destroy_medico'

  resources :consultas
  resources :pacientes, only: [:new, :create, :show, :edit, :update]
  resources :medico, only: [:new, :create, :show, :edit, :update, :new] # Adiciona :new à lista de ações permitidas

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
