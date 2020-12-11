Rails.application.routes.draw do
  root "posts#index"

  resources :posts, param: :slug
end
