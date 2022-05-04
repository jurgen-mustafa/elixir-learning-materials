defmodule Authpractice.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Authpractice.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Authpractice.PubSub}
      # Start a worker by calling: Authpractice.Worker.start_link(arg)
      # {Authpractice.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Authpractice.Supervisor)
  end
end
