Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :posts
  resources :profiles, only:[:show,:new,:edit,:create,:update]
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  
end
