defmodule Hello.Repo.Migrations.CreatePostLikes do
  use Ecto.Migration

  def change do
    create table(:post_likes) do
      add :post_id, :integer
      add :username, :string

      timestamps()
    end
  end
end
