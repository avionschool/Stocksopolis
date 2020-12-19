Rails.application.routes.draw do
 
  devise_for :users
  resources :roles

  get 'user/index'
    root 'users#index'
end
