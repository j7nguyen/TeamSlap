Rails.application.routes.draw do
  root to: "sessions#new"

  resources :leagues do
    resources :team_adds, only: [:create, :destroy]
    resources :games 
  end
  
  resources :teams do
    resources :roster_adds, only: [:create, :destroy, :new]
    resources :lineups do
      resources :lineup_positions, only: [:create, :destroy, :update]
    end
  end
  
  resources :users do
    resources :availabilities, only: [:create, :update, :destroy, :show]
  end
  
  resource :session, only: [:create, :new, :destroy]
end
