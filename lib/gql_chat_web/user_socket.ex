defmodule GqlChat.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: GqlChat.Schema
end
