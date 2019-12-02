Rails.application.routes.draw do
  root to: 'chat_rooms#index'

  resources :chat_rooms do
    resource :chat_room_user
    resources :messages
  end
end
