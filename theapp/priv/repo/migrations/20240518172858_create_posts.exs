defmodule Theapp.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :summary, :text
      add :content, :text
      add :active, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :tag_id, references(:tags, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:posts, [:user_id])
    create index(:posts, [:tag_id])
  end
end
