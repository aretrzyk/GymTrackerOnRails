Rails.application.routes.draw do
  resources :exercises
  get 'home/about'
  root "home#index"
end
