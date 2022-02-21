Rails.application.routes.draw do
  resources :cuisines
  resources :neighborhoods
  resources :favorite_dishes
  resources :users
  resources :dishes
  resources :venues
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
