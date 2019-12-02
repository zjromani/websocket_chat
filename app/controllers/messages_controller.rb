class MessagesController < ApplicationController
  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    message = @chat_room.messages.new(message_params)
    user = @current_user
    message.user = user

    message.save
    redirect_to @chat_room
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
