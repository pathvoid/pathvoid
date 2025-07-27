defmodule Pathvoid.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # Define the list of child processes to be supervised
    children = [
      # Telemetry for metrics and monitoring
      PathvoidWeb.Telemetry,
      # Database repository
      Pathvoid.Repo,
      # DNS clustering for distributed deployments
      {DNSCluster, query: Application.get_env(:pathvoid, :dns_cluster_query) || :ignore},
      # PubSub for real-time communication
      {Phoenix.PubSub, name: Pathvoid.PubSub},
      # Web endpoint to serve requests
      PathvoidWeb.Endpoint
    ]

    # Supervisor configuration with one-for-one restart strategy
    opts = [strategy: :one_for_one, name: Pathvoid.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    # Update endpoint configuration when application config changes
    PathvoidWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
