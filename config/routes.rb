Rails.application.routes.draw do
  root 'users#show'
  get '/create_account', to: 'users#new'
  get '/dashboard', to: 'users#show'
  post '/create_account', to: 'users#create'
end
