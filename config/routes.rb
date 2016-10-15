Rails.application.routes.draw do

  devise_for :users, :controllers => {registrations: "registrations"}

  root 'pages#home'
  get 'dashboard/index'
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
  
  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboard#search'
    end
  end
  
    resources :users do #might be relatable to comment
    resources :exercises 
  end
  
  resources :calories, only: [:new, :create, :show]
  resources :feeds, only: [:new, :create, :show]
  resources :preptimes, only: [:new, :create, :show]
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  resources :dashboard, only: [:index, :search]
  resources :friendships, only: [:show, :create, :destroy]
  
  get 'comments/index'
  resources :comments, only: [:index, :create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
end

