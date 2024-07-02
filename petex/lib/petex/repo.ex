defmodule Petex.Repo do
  use Ecto.Repo,
    otp_app: :petex,
    adapter: Ecto.Adapters.Postgres
end
