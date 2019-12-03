$(document).on("turbolinks:load", () => {
  $("#new_message").on("keypress", function submit(e) {
    if (e && e.keyCode == 13) {
      e.preventDefault()
      e.currentTarget.submit();
      $("#message_message").val("");
    }
  })
})