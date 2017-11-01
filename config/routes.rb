Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'documents#new'
  get '/', to: 'documents#new'
  get '/uploads', to: 'documents#index'
  get '/file/:id', to: 'documents#show'
  post '/file-upload', to: 'documents#create'

end
