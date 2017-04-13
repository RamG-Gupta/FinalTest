Rails.application.routes.draw do
  get 'password_resets/new'
  post 'users/new'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	resources :users
	resources :logins
	resources :locations
	post 'home', to: 'users#home' 
	post 'show', to: 'users#show_details'
	post 'update', to: 'users#update_details'
	post 'location', to: 'locations#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    resources :password_resets 
end
