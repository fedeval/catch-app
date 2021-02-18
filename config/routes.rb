Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :roulette, only: [:index]
  resources :video_rooms, only: [:new, :create, :show]
end
