defmodule Theapp.Blog.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :active, :boolean, default: false
    field :name, :string
    belongs_to :user, Theapp.Accounts.User
    has_many :posts, Theapp.Blog.Post

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :active, :user_id])
    |> validate_required([:name, :active, :user_id])
  end
end
