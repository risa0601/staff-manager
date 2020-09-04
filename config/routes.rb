Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "toppages#index"
  
  resources :users do
    member do
      get :schedules
      get :shifts
      get :skills
      get :active
    end
  end
  
  resources :shifts, only: [:new, :create]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :skills, only: [:index, :new, :create, :destroy]
  
  resources :having_skills, only: [:create, :destroy]
  
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
end
