Rails.application.routes.draw do

  devise_for :users
  get 'dashboard/index'

  root 'pages#home'

  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/faq', to: 'pages#faq'

  resources :recipes do
    collection do
      get 'search'
    end
    member do
      post 'like'
      post 'review'
      post 'comment' #not sure about this line
      delete 'review', to: "recipes#deletereview"
    end
  end
  
  resources :chefs, except: [:new, :destroy]
  
  get '/register', to: 'chefs#new'
  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'
  
  resources :calories, only: [:new, :create, :show]
  resources :feeds, only: [:new, :create, :show]
  resources :preptimes, only: [:new, :create, :show]
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  resources :dashboard, only: [:index, :search]
  
  get 'comments/index'
  resources :comments, only: [:index, :create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
end

