Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "toppages#index"
  
  resources :users, only: [:show, :edit, :update, :new, :create, :destroy] do
    member do
      get :schedules
      get :shifts
      get :skills
      get :pass_edit
      patch :pass_update
      put :pass_update
    end
  end
  
  resources :shifts, only: [:new, :create]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :having_skills, only: [:create, :destroy]
  
end
