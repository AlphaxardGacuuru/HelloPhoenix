defmodule Hello.SocialFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hello.Social` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        text: "some text",
        username: "some username"
      })
      |> Hello.Social.create_post()

    post
  end

  @doc """
  Generate a post_like.
  """
  def post_like_fixture(attrs \\ %{}) do
    {:ok, post_like} =
      attrs
      |> Enum.into(%{
        post_id: 42,
        username: "some username"
      })
      |> Hello.Social.create_post_like()

    post_like
  end
end
