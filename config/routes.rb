Rails.application.routes.draw do

  resource :settings, only: [:edit, :update]
  resource :sessions, only: [:new, :create, :destroy]
  resource :registrations, only: [:new, :create]
  resources :users, only: [:index, :show] do
    resource :follows, only: [:create, :destroy]
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member
   end
  root to: 'registrations#new'
  resources :tweets do
     resource :favorites, only: [:create, :destroy]
     get :timeline, on: :collection
   end

end
