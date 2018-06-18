Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/todos', to: 'todos#index'
  get '/todos/new', to: 'todos#create'
  post '/todos/store', to: 'todos#store'
  post '/todos/store_edit', to: 'todos#store_edit'
  get '/todos/:id', to: 'todos#show'
  get '/todos/:id/delete', to: 'todos#delete'
  get '/todos/:id/edit', to: 'todos#edit'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
