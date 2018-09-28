Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doctors
  resources :users
  resources :appointments
  get '/doctors/index' => 'doctors#index'
  get '/users/new' => 'users#new'
  root "pages#home"
  get '/getAppointments' => 'pages#getAppointments'
  get '/search' => 'pages#search'
  get '/book' => 'appointments#create'
  get '/login' => "auth#new"
  post '/login' => "auth#create"
  delete 'logout' => 'auth#destroy'
  get '/error' => 'test#error'
  get '/appointments/update/:id(.:format)' => 'appointments#update', :as => 'update_appointment'
end
