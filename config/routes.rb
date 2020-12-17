Rails.application.routes.draw do
  root "posts#index"

  resources :posts, param: :slug
  resource :sessions, only: [:new, :create, :destroy]
  resources :tags
end
