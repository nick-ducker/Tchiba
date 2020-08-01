Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'

  #PAGE ROUTING
  get '/', to: 'pages#home'
  get '/home', to: 'pages#home'

  get '/contact', to: 'pages#contact'
  get '/admindash', to: 'pages#admindashboard'

  get '/browse', to: 'pages#browse'

  #USER ROUTING
  get 'users/account', to: 'users#show', as: 'account'
  get 'users/reviews', to: 'users#reviewhistory', as: 'review_history'
  get 'users/orders', to: 'users#ordertransactionhistory', as: 'order_history'
  get 'users/profile/:id', to: 'users#profile', as: 'profile'

  #BLEND ROUTING
  resources :blends

  #CONVERSATION ROUTING
  resources :conversations
  post '/conversations/:id', to: 'conversations#add'
  
  #ORDER ROUTING
  resources :orders
  
  #REVIEW ROUTING
  resources :reviews

  #CART ROUTING
  get 'cart/show', to: 'carts#show'
  get 'cart/update', to: 'carts#update_quantity'
  get 'cart/remove', to: 'carts#remove_item'
  get 'cart/checkout', to: 'carts#checkout'
  
end
