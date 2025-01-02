defmodule ChatBackend.Chat do
  require Logger

  def broadcast_message(room_id, user_id, content) do
    message = %{
      room_id: room_id,
      user_id: user_id,
      content: content,
      timestamp: DateTime.utc_now(),
      node: node()
    }
    
    Phoenix.PubSub.broadcast(
      ChatBackend.PubSub,
      "room:#{room_id}",
      {:new_message, message}
    )
    
    {:ok, message}
  end
end