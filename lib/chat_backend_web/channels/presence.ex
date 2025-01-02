defmodule ChatBackendWeb.Presence do
  use Phoenix.Presence,
    otp_app: :chat_backend,
    pubsub_server: ChatBackend.PubSub
end