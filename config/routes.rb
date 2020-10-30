Rails.application.routes.draw do
  devise_for :users, controllers: {
    registration: 'users/registration',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", to: 'user/session#new'
  end

  root "comments#index"
  resources :users, only: [:index, :new, :create, :show, :destroy]
  resources :posts do
    resources :comments, only: [:index, :new, :create, :show]
  end
end
