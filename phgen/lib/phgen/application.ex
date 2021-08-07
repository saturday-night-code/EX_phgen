defmodule Phgen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Phgen.Repo,
      # Start the Telemetry supervisor
      PhgenWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phgen.PubSub},
      # Start the Endpoint (http/https)
      PhgenWeb.Endpoint
      # Start a worker by calling: Phgen.Worker.start_link(arg)
      # {Phgen.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phgen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhgenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
