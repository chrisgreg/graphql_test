defmodule GqlChat.Conversations.Conversation do
  use Ecto.Schema
  alias GqlChat.Accounts.User
  alias GqlChat.Chat.Message
  import Ecto.Changeset

  schema "conversations" do
    belongs_to :user_1, User
    belongs_to :user_2, User
    field :user_id, :integer, virtual: true

    has_many :messages, Message
    timestamps()
  end

  def changeset(conversation, attrs) do
    conversation
    |> cast(attrs, [:user_1_id, :user_2_id])
    |> validate_required([:user_1_id, :user_2_id])
  end
end
