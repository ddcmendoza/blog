Rails.application.routes.draw do
  root 'articles#index'

  get '/articles' => 'articles#index'
  
  get '/article/new' => 'articles#new', as: 'new_article'
  post '/article/create' => 'articles#create', as: 'create_article'
  get 'articles/edit/:id' => 'articles#edit', as: 'edit_article'
  patch 'articles/update/:id' => 'articles#update', as: 'update_article'
  get 'articles/destroy/:id' => 'articles#destroy', as: 'delete_article'
  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
