Rails.application.routes.draw do

  
  #workout routes
  resources :workouts do
    collection do
      get 'search'
    end
    member do
      get 'like'
      post 'like'
      post 'review'
    end
    resources :reviews, except: [:show, :index]
  end
  

  #page routes
  root 'pages#home'
  get 'dashboard/index'
  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/faq', to: 'pages#faq'

  #recipe routes
  resources :recipes do
    collection do
      get 'search'
    end
    member do
      get 'like'
      post 'like'
      post 'review'
    end
    resources :reviews, except: [:show, :index]
  end
  
  #exercises routes
  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboard#search'
    end
  end
    resources :users do #might be relatable to comment
      resources :exercises 
      resources :bodyweights
  end
  #resources
  resources :calories, only: [:new, :create, :show]
  resources :feeds, only: [:new, :create, :show]
  resources :preptimes, only: [:new, :create, :show]
  resources :styles, only: [:new, :create, :show]
  resources :ingredients, only: [:new, :create, :show]
  resources :dashboard, only: [:index, :search]
  resources :friendships, only: [:show, :create, :destroy]
  
   # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

    # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  # users rotues
  devise_for :users, :controllers => {registrations: "registrations", omniauth_callbacks: "omniauth_callbacks"}
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  
end

