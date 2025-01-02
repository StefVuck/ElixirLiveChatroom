# test/chat_backend_web/channels/room_channel_test.exs
defmodule ChatBackendWeb.RoomChannelTest do
  use ChatBackendWeb.ChannelCase
  alias ChatBackendWeb.UserSocket

  setup do
    {:ok, socket} = connect(UserSocket, %{"token" => "test-token"})
    {:ok, _, socket} = subscribe_and_join(socket, "room:lobby", %{})
    %{socket: socket}
  end

  describe "room:lobby" do
    test "can join channel", %{socket: socket} do
      assert socket.joined
      assert socket.topic == "room:lobby"
    end

    test "broadcasts messages", %{socket: socket} do
      ref = push(socket, "new_msg", %{"content" => "hello"})
      assert_reply ref, :ok
      assert_broadcast "new_msg", %{message: %{content: "hello"}}
    end

    test "can handle multiple joins" do
      # Create and join first client
      {:ok, socket1} = connect(UserSocket, %{"token" => "user1"})
      {:ok, _, socket1} = subscribe_and_join(socket1, "room:lobby", %{})

      # Create and join second client
      {:ok, socket2} = connect(UserSocket, %{"token" => "user2"})
      {:ok, _, socket2} = subscribe_and_join(socket2, "room:lobby", %{})

      # Send message from first client
      ref = push(socket1, "new_msg", %{"content" => "hello all"})
      assert_reply ref, :ok
      assert_broadcast "new_msg", %{message: %{content: "hello all"}}
    end
  end

  describe "error cases" do
    test "handles invalid message format", %{socket: socket} do
      ref = push(socket, "new_msg", %{})
      assert_reply ref, :error, %{reason: "invalid_message_format"}
    end
  end
end