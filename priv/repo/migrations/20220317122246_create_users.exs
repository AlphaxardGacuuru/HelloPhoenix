defmodule Hello.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :email, :string
      add :phone, :string
      add :bio, :string
      add :profile_pic, :string

      timestamps()
    end
  end
end
