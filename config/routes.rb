Rails.application.routes.draw do
  resources :exercise_sets
  resources :user_workouts
  resources :users
  resources :workouts
  resources :exercises
  get 'home/about'
  root "home#index"
end
