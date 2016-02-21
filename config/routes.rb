Rails.application.routes.draw do
  # get 'static_pages/home'
  #get 'users/new'

  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'

  resources :users

end
