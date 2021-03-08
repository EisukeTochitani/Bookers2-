Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root 'homes#top'
  get 'home/about' 
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  resource :favorites,only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
  
  get '/search', to: 'search#search'
  
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
    end
    resource :relationships,only: [:create,:destroy]
  end
 resources :relationships, :only => [:create, :destroy]

end