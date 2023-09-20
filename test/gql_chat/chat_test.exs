defmodule GqlChat.ChatTest do
  use GqlChat.DataCase

  alias GqlChat.Chat

  describe "messages" do
    alias GqlChat.Chat.Messages

    import GqlChat.ChatFixtures

    @invalid_attrs %{body: nil}

    test "list_messages/0 returns all messages" do
      messages = messages_fixture()
      assert Chat.list_messages() == [messages]
    end

    test "get_messages!/1 returns the messages with given id" do
      messages = messages_fixture()
      assert Chat.get_messages!(messages.id) == messages
    end

    test "create_messages/1 with valid data creates a messages" do
      valid_attrs = %{body: "some body"}

      assert {:ok, %Messages{} = messages} = Chat.create_messages(valid_attrs)
      assert messages.body == "some body"
    end

    test "create_messages/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_messages(@invalid_attrs)
    end

    test "update_messages/2 with valid data updates the messages" do
      messages = messages_fixture()
      update_attrs = %{body: "some updated body"}

      assert {:ok, %Messages{} = messages} = Chat.update_messages(messages, update_attrs)
      assert messages.body == "some updated body"
    end

    test "update_messages/2 with invalid data returns error changeset" do
      messages = messages_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_messages(messages, @invalid_attrs)
      assert messages == Chat.get_messages!(messages.id)
    end

    test "delete_messages/1 deletes the messages" do
      messages = messages_fixture()
      assert {:ok, %Messages{}} = Chat.delete_messages(messages)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_messages!(messages.id) end
    end

    test "change_messages/1 returns a messages changeset" do
      messages = messages_fixture()
      assert %Ecto.Changeset{} = Chat.change_messages(messages)
    end
  end
end
