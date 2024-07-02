defmodule Petex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PetexWeb.Telemetry,
      Petex.Repo,
      {DNSCluster, query: Application.get_env(:petex, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Petex.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Petex.Finch},
      # Start a worker by calling: Petex.Worker.start_link(arg)
      # {Petex.Worker, arg},
      # Start to serve requests, typically the last entry
      PetexWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Petex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
