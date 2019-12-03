class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    current_user.chat_rooms.each do |chat_room|
      stream_from "chat_room_#{chat_room.id}"
    end
  end
end
