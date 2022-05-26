defmodule Hello.Social do
  @moduledoc """
  The Social context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Social.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Post
    |> order_by(desc: :id)
    |> Repo.all()
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  alias Hello.Social.PostLike

  @doc """
  Returns the list of postlikes.

  ## Examples

      iex> list_postlikes()
      [%PostLike{}, ...]

  """
  def list_post_likes do
    PostLike
    |> order_by(desc: :id)
    |> Repo.all()

    # Repo.all(PostLike)
  end

  @doc """
  Gets a single post_like.

  Raises `Ecto.NoResultsError` if the Post like does not exist.

  ## Examples

      iex> get_post_like!(123)
      %PostLike{}

      iex> get_post_like!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post_like!(id), do: Repo.get!(PostLike, id)

  @doc """
  Creates a post_like.

  ## Examples

      iex> create_post_like(%{field: value})
      {:ok, %PostLike{}}

      iex> create_post_like(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post_like(attrs \\ %{}) do
    %PostLike{}
    |> PostLike.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post_like.

  ## Examples

      iex> update_post_like(post_like, %{field: new_value})
      {:ok, %PostLike{}}

      iex> update_post_like(post_like, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post_like(%PostLike{} = post_like, attrs) do
    post_like
    |> PostLike.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post_like.

  ## Examples

      iex> delete_post_like(post_like)
      {:ok, %PostLike{}}

      iex> delete_post_like(post_like)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post_like(%PostLike{} = post_like) do
    Repo.delete(post_like)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post_like changes.

  ## Examples

      iex> change_post_like(post_like)
      %Ecto.Changeset{data: %PostLike{}}

  """
  def change_post_like(%PostLike{} = post_like, attrs \\ %{}) do
    PostLike.changeset(post_like, attrs)
  end
end
