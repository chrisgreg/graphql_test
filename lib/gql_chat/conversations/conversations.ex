defmodule GqlChat.Conversations do
  alias GqlChat.Conversations.Conversation
  alias GqlChat.Repo
  import Ecto.Query

  def new_conversation(attrs) do
    case create_conversation(attrs) do
      {:ok, conversation} ->
        conversation
        |> Repo.preload([:user_1, :user_2])

        {:ok, conversation}

      error ->
        error
    end
  end

  def get_for_user(user_id) do
    from(c in Conversation, where: c.user_1_id == ^user_id or c.user_2_id == ^user_id)
    |> Repo.all()
    |> Repo.preload([:user_2, :user_1, :messages])
  end

  defp create_conversation(attrs) do
    %Conversation{}
    |> Conversation.changeset(attrs)
    |> Repo.insert()
  end
end
