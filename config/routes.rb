Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end

  root 'welcome#index'

  resources :users, only: [:new, :show, :create]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#delete"

  resources :links, only: [:index, :create]
end
