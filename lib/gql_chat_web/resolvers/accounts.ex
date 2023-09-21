defmodule GqlChatWeb.Resolvers.Accounts do
  alias GqlChat.Accounts

  def find_user(_parent, %{id: id}, _resolution) do
    {:ok, Accounts.get_user!(id)}
  end

  def find_user(%GqlChat.Accounts.User{} = author, _args, _resolution) do
    {:ok, Accounts.get_user!(author.id)}
  end

  def all_users(_, _, _resolution) do
    {:ok, Accounts.list_user()}
  end
end
