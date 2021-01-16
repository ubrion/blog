Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, param: :slug
  resource :sessions, only: %i[new create destroy]
  resources :tags

  namespace :api do
    resource :auth, only: [:create]
    resources :places do
      resources :checkins, shallow: true
    end
    resources :checkins, only: [:index]
  end
end
