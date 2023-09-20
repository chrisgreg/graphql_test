defmodule GqlChat.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string

      timestamps()
    end

    flush()

    alter table(:messages) do
      add :user_id, references(:users)
    end
  end
end
