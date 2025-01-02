defmodule ChatBackendWeb.RoomChannel do
  use Phoenix.Channel
  require Logger

  def join("room:" <> room_id, _params, socket) do
    Logger.info("Client joining room: #{room_id}")
    Process.send_after(self(), :check_health, 30_000)
    {:ok, assign(socket, :room_id, room_id)}
  end

  def handle_in("new_msg", %{"content" => content}, socket) do
    Logger.info("Received message: #{content} in room: #{socket.assigns.room_id}")
    
    # Create message payload
    message = %{
      content: content,
      user_id: socket.assigns.user_id,
      timestamp: DateTime.utc_now() |> DateTime.to_string(),
      room_id: socket.assigns.room_id
    }

    # Broadcast to all clients including sender
    broadcast!(socket, "new_msg", %{message: message})
    
    # Return success to sender
    {:reply, {:ok, %{message: message}}, socket}
  end

  def handle_in(event, payload, socket) do
    Logger.warn("Unhandled event: #{event} with payload: #{inspect(payload)}")
    {:reply, {:error, %{reason: "unhandled_event"}}, socket}
  end

  def handle_info(:after_join, socket) do
    {:noreply, socket}
  end

  def terminate(reason, socket) do
    Logger.info("Client leaving #{socket.assigns.room_id}, reason: #{inspect(reason)}")
    :ok
  end
end