defmodule GqlChat.Chat do
  @moduledoc """
  The Chat context.
  """

  import Ecto.Query, warn: false
  alias GqlChat.Repo

  alias GqlChat.Chat.Message

  @doc """
  Returns the list of message.

  ## Examples

      iex> list_message()
      [%Message{}, ...]

  """

  def data(), do: Dataloader.Ecto.new(Repo, query: &query/2)

  def query(queryable, _params) do
    queryable
  end

  def list_message(limit, offset) do
    from(m in Message)
    |> fetch_all_messages(limit, offset)
  end

  def list_message(%GqlChat.Conversations.Conversation{} = conversation, limit, offset) do
    from(m in Message, where: m.conversation_id == ^conversation.id)
    |> fetch_all_messages(limit, offset)
  end

  def list_message(%GqlChat.Accounts.User{} = user, limit, offset) do
    from(m in Message, where: m.user_id == ^user.id)
    |> fetch_all_messages(limit, offset)
  end

  defp fetch_all_messages(query, limit, offset) do
    query
    |> limit(^limit)
    |> offset(^offset)
    |> Repo.all()
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message!(id), do: Repo.get!(Message, id)

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{data: %Message{}}

  """
  def change_message(%Message{} = message, attrs \\ %{}) do
    Message.changeset(message, attrs)
  end
end
