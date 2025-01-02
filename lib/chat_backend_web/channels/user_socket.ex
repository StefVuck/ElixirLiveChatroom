defmodule ChatBackendWeb.UserSocket do
  use Phoenix.Socket
  require Logger

  channel "room:*", ChatBackendWeb.RoomChannel

  @impl true
  def connect(%{"token" => token}, socket, _connect_info) do
    Logger.info("Socket connect attempt with token: #{token}")
    {:ok, assign(socket, :user_id, "user_#{:rand.uniform(1000)}")}
  end

  @impl true
  def id(socket), do: "user_socket:#{socket.assigns.user_id}"
end