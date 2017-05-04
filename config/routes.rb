Rails.application.routes.draw do
  resources :messages
  resources :users, only: [ :create]
  root to: 'users#login'
  get '/log_out' => 'users#log_out', as: 'logout'
end
