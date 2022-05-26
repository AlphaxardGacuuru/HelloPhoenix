defmodule Hello.Social.PostLike do
  use Ecto.Schema
  import Ecto.Changeset

  schema "post_likes" do
    field :post_id, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(post_like, attrs) do
    post_like
    |> cast(attrs, [:post_id, :username])
    |> validate_required([:post_id, :username])
  end
end
