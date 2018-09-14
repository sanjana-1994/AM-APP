Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors
  resources :patients
  resources :appointments
  get '/doctors/index' => 'doctors#index'
  get '/patients/index' => 'patients#index'
  root "pages#home"
  get '/search' => 'pages#search'
  get '/book' => 'appointments#create'
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete 'logout' => 'sessions#destroy'
end
