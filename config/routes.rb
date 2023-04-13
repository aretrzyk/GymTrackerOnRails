Rails.application.routes.draw do
  get 'home/about'
  root "home#index"
end
