Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#delete"
end
