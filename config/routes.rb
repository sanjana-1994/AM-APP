Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors
  resources :patients
  resources :appointments
  get '/doctors/index' => 'doctors#index'
  root "pages#home"
  get '/search' => 'pages#search'
end