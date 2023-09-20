defmodule GqlChat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    has_many :messages, GqlChat.Chat.Message

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:username])
    |> validate_required([:username])
  end
end
