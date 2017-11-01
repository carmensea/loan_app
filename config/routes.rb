Rails.application.routes.draw do
  root to: 'documents#new'
  get '/', to: 'documents#new'
  get '/uploads', to: 'documents#index'
  get '/file/:id', to: 'documents#show'
  post '/file-upload', to: 'documents#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

end
