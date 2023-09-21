defmodule GqlChatWeb.Resolvers.Conversation do
  alias GqlChat.Conversations

  def list_conversations(_parent, %{user_id: user_id}, _resolution) do
    {:ok, Conversations.get_for_user(user_id)}
  end

  def create_conversation(_parent, %{user_1_id: user_1_id, user_2_id: user_2_id}, _resolution) do
    Conversations.new_conversation(%{user_1_id: user_1_id, user_2_id: user_2_id})
  end

  # TODO: Handle if current user not allowed to do this
end
