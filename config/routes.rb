Rails.application.routes.draw do
  resources :follow_requests
  resources :comments
  resources :favorites
  resources :tags
  resources :articles
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
