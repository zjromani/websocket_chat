import consumer from "./consumer"

consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const active_chatroom = $(`[data-behavior='messages'][data-chat-room-id='${data.chat_room_id}']`);

    if (active_chatroom.children().length > 10) {
      active_chatroom.children().first().remove();
    }

    active_chatroom.append(`<div>>${data.user}: ${data.message}</div>`);
  },
});
