defmodule Hello.SocialTest do
  use Hello.DataCase

  alias Hello.Social

  describe "posts" do
    alias Hello.Social.Post

    import Hello.SocialFixtures

    @invalid_attrs %{text: nil, username: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Social.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Social.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{text: "some text", username: "some username"}

      assert {:ok, %Post{} = post} = Social.create_post(valid_attrs)
      assert post.text == "some text"
      assert post.username == "some username"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{text: "some updated text", username: "some updated username"}

      assert {:ok, %Post{} = post} = Social.update_post(post, update_attrs)
      assert post.text == "some updated text"
      assert post.username == "some updated username"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_post(post, @invalid_attrs)
      assert post == Social.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Social.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Social.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Social.change_post(post)
    end
  end

  describe "postlikes" do
    alias Hello.Social.PostLike

    import Hello.SocialFixtures

    @invalid_attrs %{post_id: nil, username: nil}

    test "list_postlikes/0 returns all postlikes" do
      post_like = post_like_fixture()
      assert Social.list_postlikes() == [post_like]
    end

    test "get_post_like!/1 returns the post_like with given id" do
      post_like = post_like_fixture()
      assert Social.get_post_like!(post_like.id) == post_like
    end

    test "create_post_like/1 with valid data creates a post_like" do
      valid_attrs = %{post_id: 42, username: "some username"}

      assert {:ok, %PostLike{} = post_like} = Social.create_post_like(valid_attrs)
      assert post_like.post_id == 42
      assert post_like.username == "some username"
    end

    test "create_post_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_post_like(@invalid_attrs)
    end

    test "update_post_like/2 with valid data updates the post_like" do
      post_like = post_like_fixture()
      update_attrs = %{post_id: 43, username: "some updated username"}

      assert {:ok, %PostLike{} = post_like} = Social.update_post_like(post_like, update_attrs)
      assert post_like.post_id == 43
      assert post_like.username == "some updated username"
    end

    test "update_post_like/2 with invalid data returns error changeset" do
      post_like = post_like_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_post_like(post_like, @invalid_attrs)
      assert post_like == Social.get_post_like!(post_like.id)
    end

    test "delete_post_like/1 deletes the post_like" do
      post_like = post_like_fixture()
      assert {:ok, %PostLike{}} = Social.delete_post_like(post_like)
      assert_raise Ecto.NoResultsError, fn -> Social.get_post_like!(post_like.id) end
    end

    test "change_post_like/1 returns a post_like changeset" do
      post_like = post_like_fixture()
      assert %Ecto.Changeset{} = Social.change_post_like(post_like)
    end
  end

  describe "post_likes" do
    alias Hello.Social.PostLike

    import Hello.SocialFixtures

    @invalid_attrs %{}

    test "list_post_likes/0 returns all post_likes" do
      post_like = post_like_fixture()
      assert Social.list_post_likes() == [post_like]
    end

    test "get_post_like!/1 returns the post_like with given id" do
      post_like = post_like_fixture()
      assert Social.get_post_like!(post_like.id) == post_like
    end

    test "create_post_like/1 with valid data creates a post_like" do
      valid_attrs = %{}

      assert {:ok, %PostLike{} = post_like} = Social.create_post_like(valid_attrs)
    end

    test "create_post_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_post_like(@invalid_attrs)
    end

    test "update_post_like/2 with valid data updates the post_like" do
      post_like = post_like_fixture()
      update_attrs = %{}

      assert {:ok, %PostLike{} = post_like} = Social.update_post_like(post_like, update_attrs)
    end

    test "update_post_like/2 with invalid data returns error changeset" do
      post_like = post_like_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_post_like(post_like, @invalid_attrs)
      assert post_like == Social.get_post_like!(post_like.id)
    end

    test "delete_post_like/1 deletes the post_like" do
      post_like = post_like_fixture()
      assert {:ok, %PostLike{}} = Social.delete_post_like(post_like)
      assert_raise Ecto.NoResultsError, fn -> Social.get_post_like!(post_like.id) end
    end

    test "change_post_like/1 returns a post_like changeset" do
      post_like = post_like_fixture()
      assert %Ecto.Changeset{} = Social.change_post_like(post_like)
    end
  end
end
