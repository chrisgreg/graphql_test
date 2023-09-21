defmodule GqlChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    has_many :conversations, GqlChat.Conversations.Conversation

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:username])
    |> validate_required([:username])
  end
end
