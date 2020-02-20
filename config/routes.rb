Rails.application.routes.draw do
  root to: 'doctors#index'
  resources :doctors do
  	collection do
    	get :search
    	get :available
  	end
  end
  resources :appointments
end