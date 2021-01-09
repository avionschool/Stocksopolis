Rails.application.routes.draw do
 
  devise_for :users
  resources :roles
  resources :stocks
  resources :users do
    resources :transactions
  end
  

  
  root 'users#index'


  get '/search' => 'users#search', :as => 'search_page'
  post '/search' => 'transactions#create'
end
