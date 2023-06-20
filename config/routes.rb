Rails.application.routes.draw do
  resources :workouts do
    resources :exercise_sets
  end
  resources :exercises do
    resources :exercise_sets
  end
  resources :exercise_sets
  resources :exercises
  resources :users
  resources :workouts

  get 'home/about'
  root "home#index"
end
