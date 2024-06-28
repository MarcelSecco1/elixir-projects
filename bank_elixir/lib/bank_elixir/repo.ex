defmodule BankElixir.Repo do
  use Ecto.Repo,
    otp_app: :bank_elixir,
    adapter: Ecto.Adapters.Postgres
end
