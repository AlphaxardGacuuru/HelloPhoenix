defmodule HelloWeb.PostLikeController do
  use HelloWeb, :controller

  alias Hello.Social
  alias Hello.Social.PostLike

  action_fallback HelloWeb.FallbackController

  def index(conn, _params) do
    post_likes = Social.list_post_likes()
    render(conn, "index.json", post_likes: post_likes)
  end

  def create(conn, %{"post_like" => post_like_params}) do
    with {:ok, %PostLike{} = post_like} <- Social.create_post_like(post_like_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.post_like_path(conn, :show, post_like))
      |> render("show.json", post_like: post_like)
    end
  end

  def show(conn, %{"id" => id}) do
    post_like = Social.get_post_like!(id)
    render(conn, "show.json", post_like: post_like)
  end

  def update(conn, %{"id" => id, "post_like" => post_like_params}) do
    post_like = Social.get_post_like!(id)

    with {:ok, %PostLike{} = post_like} <- Social.update_post_like(post_like, post_like_params) do
      render(conn, "show.json", post_like: post_like)
    end
  end

  def delete(conn, %{"id" => id}) do
    post_like = Social.get_post_like!(id)

    with {:ok, %PostLike{}} <- Social.delete_post_like(post_like) do
      send_resp(conn, :no_content, "")
    end
  end
end
