Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :leauges do
    resources :teams, only: [ :new, :create ]
  end 
  
  resources :teams, only: [ :show, :edit, :update, :destroy] 
    # resources :players, only: [ :new, :create ]
  

  resources :players, only: [ :new, :create, :edit, :update, :destroy ]

end
