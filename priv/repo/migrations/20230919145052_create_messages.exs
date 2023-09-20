defmodule GqlChat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body, :string

      timestamps()
    end
  end
end
