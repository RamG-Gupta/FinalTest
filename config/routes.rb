Rails.application.routes.draw do
	resources :users
	resources :logins
	resources :locations
	post 'home', to: 'users#home' 
	post 'show', to: 'users#show_details'
	post 'update', to: 'users#update_details'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
