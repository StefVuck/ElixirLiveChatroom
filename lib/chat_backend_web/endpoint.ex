defmodule ChatBackendWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :chat_backend

  socket "/socket", ChatBackendWeb.UserSocket,
    websocket: [
      timeout: 45_000,
      connect_info: [:peer_data, :uri],
      check_origin: false,  # For development
      transport_log: false
    ],
    longpoll: false

  plug Plug.Static,
    at: "/", 
    from: {:phoenix, "priv/static"},
    only: ~w(phoenix.js)
    
  plug Plug.Static,
    at: "/",
    from: :chat_backend,
    gzip: false,
    only: ~w(js test.html favicon.ico)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug ChatBackendWeb.Router
end