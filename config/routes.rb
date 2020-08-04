Rails.application.routes.draw do
  devise_for :users
  root "comments#index"
  resources :user, only: [:index, :new, :create]
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: [:index, :new, :create]
  end
end
