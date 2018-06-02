Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/todos', to: 'todos#index'
  get '/todos/new', to: 'todos#create'
  post '/todos/store', to: 'todos#store'
  post '/todos/store_edit', to: 'todos#store_edit'
  get '/todos/:id', to: 'todos#show'
  get '/todos/:id/delete', to: 'todos#delete'
  get '/todos/:id/edit', to: 'todos#edit'
end
