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
      arg(:limit, :integer, default_value: 5)
      arg(:offset, :integer, default_value: 0)
      resolve(&Resolvers.Chat.list_messages/3)
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.Accounts.all_users/3)
    end

    @desc "Get user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end

    @desc "Get all conversations for a user"
    field :conversations, list_of(:conversation) do
      arg(:user_id, non_null(:id))
      resolve(&Resolvers.Conversation.list_conversations/3)
    end
  end

  mutation do
    @desc "Create a new conversation between two users"
    field :create_conversation, type: :conversation do
      arg(:user_1_id, non_null(:integer))
      arg(:user_2_id, non_null(:integer))

      resolve(&Resolvers.Conversation.create_conversation/3)
    end

    @desc "Create a new message for a conversation"
    field :create_message, type: :message do
      arg(:user_id, non_null(:integer))
      arg(:conversation_id, non_null(:integer))
      arg(:body, non_null(:string))

      resolve(&Resolvers.Chat.create_message/3)
    end
  end
end
