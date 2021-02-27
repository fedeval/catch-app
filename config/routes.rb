Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bookings, only: [:index, :create, :update]

  resources :dashboard, only: [:index]

  resources :video_rooms, only: [:create, :show]

  resources :user_badges, only: [:index, :create]

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end

  mount ActionCable.server => "/chatrooms"
end
