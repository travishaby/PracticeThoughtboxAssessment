Rails.application.routes.draw do
  get '/login', to: 'users#new'
  get '/dashboard', to: 'users#show'
end
