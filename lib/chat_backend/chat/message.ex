defmodule ChatBackend.Chat.Message do
  @moduledoc """
  Message structure and validation
  """
  
  @type t :: %__MODULE__{
    id: String.t(),
    room_id: String.t(),
    user_id: String.t(),
    content: String.t(),
    timestamp: DateTime.t(),
    node: atom()
  }
  
  defstruct [:id, :room_id, :user_id, :content, :timestamp, :node]
  
  def validate(message) do
    # Add validation logic here
    {:ok, message}
  end
end