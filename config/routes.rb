Rails.application.routes.draw do
  root to: "sessions#new"
  
  resources :teams do
    resources :roster_adds, only: [:create, :destroy, :new]
  end
  
  resources :users
  resource :session, only: [:create, :new, :destroy]
end
