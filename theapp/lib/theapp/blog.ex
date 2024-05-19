defmodule Theapp.Blog do
    @moduledoc """
    The Blog module provides functions for listing tags and posts.
    """

    import Ecto.Query, warn: false
    alias Theapp.Repo
    alias Theapp.Blog.{Tag, Post}

    def list_tags do
      Repo.all(Tag)
    end

    def list_posts do
      Repo.all(Post)
    end

  def get_post!(id) do
    Post
    |> Repo.get(id)
    |> Repo.preload(:tags)
  end

  def get_tag!(id) do
    Tag
    |> Repo.get(id)
    |> Repo.preload(:posts)
  end

  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

end
