defmodule GqlChatWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  alias GqlChatWeb.Resolvers

  @desc "A user of the chat application"
  object :user do
    field :id, :id
    field :username, :string

    field :messages, list_of(:message) do
      resolve(&Resolvers.Chat.list_messages/3)
    end
  end
end
