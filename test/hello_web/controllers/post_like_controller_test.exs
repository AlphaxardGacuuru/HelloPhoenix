defmodule HelloWeb.PostLikeControllerTest do
  use HelloWeb.ConnCase

  import Hello.SocialFixtures

  alias Hello.Social.PostLike

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all post_likes", %{conn: conn} do
      conn = get(conn, Routes.post_like_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create post_like" do
    test "renders post_like when data is valid", %{conn: conn} do
      conn = post(conn, Routes.post_like_path(conn, :create), post_like: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.post_like_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.post_like_path(conn, :create), post_like: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update post_like" do
    setup [:create_post_like]

    test "renders post_like when data is valid", %{conn: conn, post_like: %PostLike{id: id} = post_like} do
      conn = put(conn, Routes.post_like_path(conn, :update, post_like), post_like: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.post_like_path(conn, :show, id))

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, post_like: post_like} do
      conn = put(conn, Routes.post_like_path(conn, :update, post_like), post_like: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete post_like" do
    setup [:create_post_like]

    test "deletes chosen post_like", %{conn: conn, post_like: post_like} do
      conn = delete(conn, Routes.post_like_path(conn, :delete, post_like))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.post_like_path(conn, :show, post_like))
      end
    end
  end

  defp create_post_like(_) do
    post_like = post_like_fixture()
    %{post_like: post_like}
  end
end
