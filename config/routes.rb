Rails.application.routes.draw do

  root to: 'static_pages#home'

  get    'signup', to: 'users#new'

  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'users/update'
  get 'users/edit'

  #get 'users/followers/:id', to: 'users#followers'
  #get 'users/following/:id', to: 'users#following' 

  resources :users do
    member do
      get :followings
      get :followers
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
