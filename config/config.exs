import Config

config :chat_backend, ChatBackendWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [formats: [json: ChatBackendWeb.ErrorJSON], layout: false],
  pubsub_server: ChatBackend.PubSub

# Configure logger
config :logger,
  level: :info,
  handle_sasl_reports: true,
  handle_otp_reports: true

# Remove any Swoosh configuration if it exists

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"