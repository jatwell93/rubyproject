Rails.application.routes.draw do
    
  root "pages#home"
    
  get "/home" => "pages#home"
  
  # get '/recipes' => 'recipes#index'
  # get '/recipes/new' => 'recipes@new', as: 'new_recipe'
  # post '/recipes' => 'recipes#create'
  # get '/recipes/:id/edit' => 'recipes#edit', as: 'edit_recipe'
  # patch '/recipes/:id' => 'recipes#update'
  # get '/recipes/:id' => 'recipes#show', as: 'recipe'
  # delete '/recipes/:id' => 'recipes#destroy'
  
  resources :recipes do 
    member do 
      post 'like'
    end
  end
  
  resources :chefs, except: [:new]
  
  get '/register' => 'chefs#new'
  
  get '/login' => 'logins#new'
  post '/login' => 'logins#create'
  get '/logout' => 'logins#destroy'
  
end
