defmodule Crudopdracht.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Crudopdracht.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Crudopdracht.PubSub}
      # Start a worker by calling: Crudopdracht.Worker.start_link(arg)
      # {Crudopdracht.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Crudopdracht.Supervisor)
  end
end
