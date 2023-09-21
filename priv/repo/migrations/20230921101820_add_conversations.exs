defmodule GqlChat.Repo.Migrations.AddConversations do
  use Ecto.Migration

  def change do
    create table(:conversations) do
      add :user_1_id, references(:users)
      add :user_2_id, references(:users)
      timestamps()
    end

    flush()

    alter table(:messages) do
      add :conversation_id, references(:conversations)
    end
  end
end
