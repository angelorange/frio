defmodule Frio.Repo do
  use Ecto.Repo,
    otp_app: :frio,
    adapter: Ecto.Adapters.Postgres
end
