defmodule GqlChatWeb.Resolvers.Accounts do
  alias GqlChat.Accounts

  def find_user(_parent, %{id: id}, _resolution) do
    {:ok, Accounts.get_user!(id)}
  end
end
