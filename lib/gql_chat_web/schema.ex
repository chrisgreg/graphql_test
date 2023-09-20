defmodule GqlChatWeb.Schema do
  use Absinthe.Schema

  import_types(GqlChatWeb.Schema.AccountTypes)
  import_types(GqlChatWeb.Schema.ContentTypes)
  alias GqlChatWeb.Resolvers

  query do
    @desc "Get all messages"
    field :messages, list_of(:message) do
      resolve(&Resolvers.Chat.list_messages/3)
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end
  end
end
