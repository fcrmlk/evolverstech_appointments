Rails.application.routes.draw do
  root to: 'doctors#index'
  resources :doctors
  resources :appointments
end