defmodule GqlChat.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: GqlChatWeb.Schema

  def connect(params, socket) do
    socket =
      Absinthe.Phoenix.Socket.put_options(socket,
        context: %{current_user: params}
      )

    {:ok, socket}
  end

  def id(_socket), do: nil
end
