defmodule Testing.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Testing.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Testing.PubSub}
      # Start a worker by calling: Testing.Worker.start_link(arg)
      # {Testing.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Testing.Supervisor)
  end
end
