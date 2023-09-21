defmodule GqlChatWeb.Resolvers.Conversation do
  alias GqlChat.Conversations

  def list_conversations(_parent, %{user_id: user_id}, _resolution) do
    {:ok, Conversations.get_for_user(user_id)}
  end
end
