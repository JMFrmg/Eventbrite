Rails.application.routes.draw do

  root 'events#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resource :session
  resources :events do
  	post 'attend', on: :member
  end

  
end
