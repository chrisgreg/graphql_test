defmodule GqlChat.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GqlChat.Accounts` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        username: "some username"
      })
      |> GqlChat.Accounts.create_users()

    users
  end
end
