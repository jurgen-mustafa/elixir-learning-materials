defmodule UserCatsRefWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      UserCatsRefWeb.Telemetry,
      # Start the Endpoint (http/https)
      UserCatsRefWeb.Endpoint
      # Start a worker by calling: UserCatsRefWeb.Worker.start_link(arg)
      # {UserCatsRefWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UserCatsRefWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UserCatsRefWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
