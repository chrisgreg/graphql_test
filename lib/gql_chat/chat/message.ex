defmodule GqlChat.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    belongs_to :user, GqlChat.Accounts.User
    belongs_to :conversation, GqlChat.Conversations.Conversation

    timestamps()
  end

  @doc false
  def changeset(messages, attrs) do
    messages
    |> cast(attrs, [:body, :user_id, :conversation_id])
    |> validate_required([:body, :user_id, :conversation_id])
  end
end
