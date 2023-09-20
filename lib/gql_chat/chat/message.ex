defmodule GqlChat.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    belongs_to :user, GqlChat.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(messages, attrs) do
    messages
    |> cast(attrs, [:body, :user_id])
    |> validate_required([:body])
  end
end
