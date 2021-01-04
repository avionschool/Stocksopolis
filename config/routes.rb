Rails.application.routes.draw do
 
  devise_for :users
  resources :roles
  resources :stocks
  resources :users do
    resources :transactions
  end
  

  
  root 'users#index'
  post '/users/:user_id/transaction'=> 'transaction#create',  as: 'user_create'
  get '/buy' => 'transactions#buy', :as => 'buy_page'
  get '/search' => 'users#search', :as => 'search_page'
end
