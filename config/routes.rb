Rails.application.routes.draw do
 
  devise_for :users
  resources :roles

  patch 'users/:id/toggle_status', to: 'users#toggle_status', as: 'user_toggle_status'
  get 'user/index'
  root 'users#index'
 
end
