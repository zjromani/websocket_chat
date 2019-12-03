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
    // const id = $("#message_message");
    // console.log(id.val());
    // console.log(data);
    // Called when there's incoming data on the websocket for this channel
    active_chatroom.append(`<div>>${data.user}: ${data.message}</div>`);
    active_chatroom.children().first().remove();
  },
});
