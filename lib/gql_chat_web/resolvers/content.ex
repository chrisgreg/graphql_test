defmodule GqlChatWeb.Resolvers.Chat do
  alias GqlChat.Chat

  def list_messages(%GqlChat.Conversations.Conversation{} = conversation, _args, _resolution) do
    {:ok, Chat.list_message(conversation)}
  end

  def list_messages(%GqlChat.Accounts.User{} = author, _args, _resolution) do
    {:ok, Chat.list_message(author)}
  end

  def list_messages(_parent, _args, _resolution) do
    {:ok, Chat.list_message()}
  end
end
