class ChatRoomsController < ApplicationController
  def index
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = @chat_room.messages.includes(:user).order(created_at: :desc).limit(10).reverse
    @chat_users = @chat_room.chat_room_users.includes(:user)
  end
end
