defmodule Foodtruckmatch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FoodtruckmatchWeb.Telemetry,
      Foodtruckmatch.Repo,
      {DNSCluster, query: Application.get_env(:foodtruckmatch, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Foodtruckmatch.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Foodtruckmatch.Finch},
      # Start a worker by calling: Foodtruckmatch.Worker.start_link(arg)
      # {Foodtruckmatch.Worker, arg},
      # Start to serve requests, typically the last entry
      FoodtruckmatchWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Foodtruckmatch.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodtruckmatchWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
