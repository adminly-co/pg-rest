PgRest::Engine.routes.draw do

  root 'tables#index'
  
  resources :tables do 
    resources :columns, only: [:create, :destroy]
  end 

end
