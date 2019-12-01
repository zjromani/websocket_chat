Rails.application.routes.draw do
  resources :messages
  resources :chat_rooms
  resources :users
end
