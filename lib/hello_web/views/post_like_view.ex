defmodule HelloWeb.PostLikeView do
  use HelloWeb, :view
  alias HelloWeb.PostLikeView

  def render("index.json", %{post_likes: post_likes}) do
    %{data: render_many(post_likes, PostLikeView, "post_like.json")}
  end

  def render("show.json", %{post_like: post_like}) do
    %{data: render_one(post_like, PostLikeView, "post_like.json")}
  end

  def render("post_like.json", %{post_like: post_like}) do
    %{
      id: post_like.id,
      post_id: post_like.post_id,
      username: post_like.username
    }
  end
end
