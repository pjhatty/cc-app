Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'
  post 'meets/add_position' => 'meets#create_position', as: 'create_position'
  get 'meets/new_position' => 'meets#new_position', as: 'new_position'
  delete 'meets/destroy_position/:id' => 'meets#destroy_position', as: 'destroy_position'

  post 'wods/add_score' => 'wods#create_score', as: 'create_score'
  get 'wods/new_score' => 'wods#new_score', as: 'new_score'
  delete 'wods/destroy_score/:id' => 'wods#destroy_score', as: 'destroy_score'

  get '/dashboard' => 'dashboard#index'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :notices
  resources :wods
  resources :meets
  resources :athletes

end
