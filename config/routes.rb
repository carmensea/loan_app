Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/new', to: 'box#new'
  get '/', to: 'box#index'
  post '/file-upload', to: 'box#create'
  resources :uploads
end
