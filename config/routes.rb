Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "toppages#index"
  

  post "users", to: "users#create"
  get "users/new", to: "users#new"
  get "users/:id/schedule", to: "users#schedule"
  delete "users/:id", to: "users#destroy"
  get "users/:id/shift", to: "users#shift"
  get "users/:id/skill", to: "users#skill"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
end
