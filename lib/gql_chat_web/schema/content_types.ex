defmodule GqlChatWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  object :message do
    field :id, :id
    field :body, :string

    field :user, :user do
      resolve(dataloader(GqlChat.Accounts))
    end
  end

  object :conversation do
    field :id, :id
    field :user_1, :user
    field :user_2, :user

    field :messages, list_of(:message) do
      resolve(dataloader(GqlChat.Chat))
    end
  end
end
