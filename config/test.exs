import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chat_backend, ChatBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "your_test_secret_key_base",
  server: false,
  pubsub_server: ChatBackend.PubSub  # Make sure this is here

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime