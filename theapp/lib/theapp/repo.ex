defmodule Theapp.Repo do
  use Ecto.Repo,
    otp_app: :theapp,
    adapter: Ecto.Adapters.Postgres
end
