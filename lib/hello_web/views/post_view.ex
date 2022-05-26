defmodule HelloWeb.PostView do
  use HelloWeb, :view
  alias HelloWeb.PostView

  def render("index.json", %{posts: posts}) do
    # render_many(posts, PostView, "post.json")
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    # Check if user has followed musician
    hasFollowed = true

    # Check if user has liked post
    hasLiked = true

    # Check whether post is edited
    isEdited = post.inserted_at != post.updated_at

    %{
      id: post.id,
      username: post.username,
      text: post.text,
      likes: 0,
      comments: 0,
      hasLiked: hasLiked,
      hasFollowed: hasFollowed,
      isEdited: isEdited,
      updated_at: post.updated_at,
      inserted_at: post.inserted_at
    }
  end
end
