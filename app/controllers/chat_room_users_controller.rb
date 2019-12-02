class ChatRoomUsersController < ApplicationController
  before_action :set_chat_room

  def create
    ChatRoomUser.where(chat_room: @chat_room, user: @current_user).first_or_create
    redirect_to @chat_room
  end

  def destroy
    # Kill all subscriptions to channel if the user had more than one.
    ChatRoomUser.where(chat_room: @chat_room, user: @current_user).destroy_all
    redirect_to root_path
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find_by(id: params[:chat_room_id])
  end
end
