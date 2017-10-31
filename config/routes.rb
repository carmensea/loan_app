Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/new', to: 'documents#new'
  get '/uploads', to: 'documents#index'
  get '/file/:id', to: 'documents#show'
  post '/file-upload', to: 'documents#create'

end
