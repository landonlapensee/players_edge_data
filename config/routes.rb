Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :leauges do
    resources :teams, only: [ :new, :create ]
  end 

  resources :teams, only: [ :show, :edit, :update, :destroy]


  # resources :leauges do
  #   resources :projections, only [ :index ]
  # end 

  # resources :lessons, only: [ :index, :new, :create, :edit, :update, :destroy ] do
  #   resources :bookings, only: [ :new, :create ]
  #   resources :available_times, only: :index, controller: "lessons/available_times"
  # end
end
