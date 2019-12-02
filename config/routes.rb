Rails.application.routes.draw do
  root to: "chat_rooms#index"

  resources :messages
  resources :chat_rooms
  resources :users
end
