Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bookings, only: [:index, :create, :update]

  resources :dashboard, only: [:index]

  resources :video_rooms, only: [:show]

  get "/video_rooms/:id/end", to: "video_rooms#end", as: "end_video_room"

  post "/user_badge/assign", to: "user_badges#assign"

  post "/friendships/add_friend", to: "friendships#add_friend", as: "add_friend"

  post "/friendships/accept_request", to: "friendships#accept_request", as: "accept_request"

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end

  mount ActionCable.server => "/chatrooms"
end
