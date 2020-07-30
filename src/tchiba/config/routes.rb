Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'

  #PAGE ROUTING
  get '/', to: 'pages#home'
  get '/home', to: 'pages#home'

  get '/contact', to: 'pages#contact'
  get '/admindash', to: 'pages#admindashboard'

  get '/browse', to: 'pages#browse'

  #USER ROUTING
  get 'users/account', to: 'users#show'
  get 'users/reviews', to: 'users#reviewhistory'
  get 'users/orders', to: 'users#ordertransactionhistory'
  get 'users/profile/:id', to: 'users#profile'

end
