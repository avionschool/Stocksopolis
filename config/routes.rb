Rails.application.routes.draw do
 
  devise_for :users
  resources :roles
  resources :stocks

  root 'users#index'

  get '/search' => 'users#search', :as => 'search_page'
end
