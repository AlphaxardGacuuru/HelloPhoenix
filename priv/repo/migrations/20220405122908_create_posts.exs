defmodule Hello.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :username, :string
      add :text, :string
      add :media, :string

      timestamps()
    end
  end
end
