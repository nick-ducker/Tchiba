Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'

  #PAGE ROUTING
  get '/', to: 'pages#home'
  get '/home', to: 'pages#home'

  get '/contact', to: 'pages#contact', as: 'contact'

  get '/browse', to: 'pages#browse', as: 'browse'
  post '/browse', to: 'pages#search'

  #USER ROUTING
  get 'users/account', to: 'users#show', as: 'account'
  get 'users/reviews', to: 'users#reviewhistory', as: 'review_history'
  get 'users/orders', to: 'users#ordertransactionhistory', as: 'order_history'
  get 'users/profile/:id', to: 'users#profile', as: 'profile'
  get '/credit', to: 'users#calculate_credit', as: 'credit'

  #BLEND ROUTING
  resources :blends do
    member do
      delete :delete_image
    end
  end

  #CONVERSATION ROUTING
  resources :conversations
  post '/conversations/:id', to: 'conversations#add', as: 'add_message'
  patch '/inactive/:id', to: 'conversations#inactive', as: 'inactive'

  #ORDER ROUTING
  resources :orders do
    member do
      get :successful_payment
      get :failed_payment
    end
  end
  post "/orders/webhook", to: "orders#webhook"
  
  #REVIEW ROUTING
  resources :reviews

  #CART ROUTING
  get 'cart/show', to: 'carts#show'
  patch 'cart/update/:id', to: 'carts#update_quantity', as: 'cart_update'
  post 'cart/add/:id', to: 'carts#add_item', as: 'cart_add'
  post 'cart/remove/:id', to: 'carts#remove_item', as: 'cart_remove'
  
end
