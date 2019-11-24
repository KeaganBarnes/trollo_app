Rails.application.routes.draw do
  devise_for :users
  root "programs#index"

  resources :programs do 
    resources :workouts
  end
  
end
