Rails.application.routes.draw do
 
  devise_for :users
  resources :roles
  resources :stocks
  resources :users do
    resources :transactions
  end
  

  

  patch 'users/:id/toggle_status', to: 'users#toggle_status', as: 'user_toggle_status'
  get 'user/index'
  root 'users#index'


  get '/search' => 'users#search', :as => 'search_page'
  post '/search' => 'transactions#create'
end
