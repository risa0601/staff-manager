Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "toppages#index"
  
  resources :users do
    member do
      get :shifts
      get :skills
      get :activate
      get :skill
    end
  end
  
  resources :shifts, only: [:show, :new, :create]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :skills, only: [:show, :index, :new, :create, :destroy] 
  
  resources :parties, only: [:show, :index, :new, :create, :destroy,] do
    member do
      get :tehai
    end
  end
  
  resources :having_skills, only: [:create, :destroy]
  
  resources :shift_dicisions, only: [:create, :destroy]
  
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
end
