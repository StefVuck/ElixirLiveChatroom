defmodule ChatBackendWeb.ChannelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Phoenix.ChannelTest
      import ChatBackendWeb.ChannelCase
      @endpoint ChatBackendWeb.Endpoint
    end
  end

  setup _tags do
    :ok
  end
end