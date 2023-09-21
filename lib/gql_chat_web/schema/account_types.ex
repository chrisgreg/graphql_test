defmodule GqlChatWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  @desc "A user of the chat application"
  object :user do
    field :id, :id
    field :username, :string

    field :messages, list_of(:message) do
      resolve(dataloader(GqlChat.Chat))
    end
  end
end
