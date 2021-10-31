PgRest::Engine.routes.draw do

  root 'schema#index'

  get 'schema' => 'schema#schema'
  
  resources :tables
  resources :columns, only: [:create, :delete]

end
