defmodule GqlChatWeb.Resolvers.Chat do
  alias GqlChat.Chat

  def list_messages(
        %GqlChat.Conversations.Conversation{} = conversation,
        %{limit: limit, offset: offset},
        _resolution
      ) do
    {:ok, Chat.list_message(conversation, limit, offset)}
  end

  def list_messages(
        %GqlChat.Accounts.User{} = author,
        %{limit: limit, offset: offset},
        _resolution
      ) do
    {:ok, Chat.list_message(author, limit, offset)}
  end

  def list_messages(_parent, %{limit: limit, offset: offset}, _resolution) do
    {:ok, Chat.list_message(limit, offset)}
  end

  @spec create_message(
          any,
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any},
          any
        ) :: any
  def create_message(_parent, args, _resolution) do
    Chat.create_message(args)
  end
end
