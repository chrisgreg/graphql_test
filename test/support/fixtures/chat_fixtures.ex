defmodule GqlChat.ChatFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GqlChat.Chat` context.
  """

  @doc """
  Generate a messages.
  """
  def messages_fixture(attrs \\ %{}) do
    {:ok, messages} =
      attrs
      |> Enum.into(%{
        body: "some body"
      })
      |> GqlChat.Chat.create_messages()

    messages
  end
end
