defmodule ChatBackendWeb.Router do
  use Phoenix.Router
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChatBackendWeb do
    pipe_through :api
  end

  # Remove the live_dashboard import and route
end