defmodule Theapp.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :active, :boolean, default: false
    field :title, :string
    field :summary, :string
    field :content, :string
    belongs_to :user, Theapp.Accounts.User
    belongs_to :tag, Theapp.Blog.Tag

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :summary, :content, :active, :user_id, :tag_id])
    |> validate_required([:title, :summary, :content, :active, :user_id, :tag_id])
  end
end
