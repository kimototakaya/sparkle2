Rails.application.routes.draw do
  devise_for :users, controllers: {
    registration: 'users/registration'
  }
  root "comments#index"
  resources :users, only: [:index, :new, :create]
  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: [:index, :new, :create]
  end
end
