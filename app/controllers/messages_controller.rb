class MessagesController < ApplicationController
  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    message = @chat_room.messages.new(message_params)
    user = @current_user
    message.user = user

    message.save
    ActionCable.server.broadcast "chat_room_#{@chat_room.id}",
      message: message.message,
      user: user.name,
      chat_room_id: @chat_room.id
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
