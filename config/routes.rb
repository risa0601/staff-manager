Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "toppages#index"
  
  resources :users, only: [:new, :create, :destroy] do
    member do
      get :schedules
      get :shifts
      get :skills
    end
  end
  
  resources :shifts, only: [:new, :create]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :having_skills, only: [:create, :destroy]
  
end
