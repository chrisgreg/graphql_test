defmodule GqlChatWeb.Schema do
  use Absinthe.Schema

  import_types(GqlChatWeb.Schema.AccountTypes)
  import_types(GqlChatWeb.Schema.ContentTypes)

  alias GqlChatWeb.Resolvers
  alias GqlChat.{Accounts, Chat}

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Accounts, Accounts.data())
      |> Dataloader.add_source(Chat, Chat.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

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

    @desc "Get all conversations"
    field :conversations, list_of(:conversation) do
      arg(:user_id, non_null(:id))
      resolve(&Resolvers.Conversation.list_conversations/3)
    end
  end
end
