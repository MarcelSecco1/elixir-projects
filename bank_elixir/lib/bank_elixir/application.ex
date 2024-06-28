defmodule BankElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BankElixirWeb.Telemetry,
      BankElixir.Repo,
      {DNSCluster, query: Application.get_env(:bank_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BankElixir.PubSub},
      # Start a worker by calling: BankElixir.Worker.start_link(arg)
      # {BankElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      BankElixirWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BankElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BankElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
