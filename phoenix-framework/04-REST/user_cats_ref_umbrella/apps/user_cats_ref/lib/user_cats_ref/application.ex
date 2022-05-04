defmodule UserCatsRef.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      UserCatsRef.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: UserCatsRef.PubSub}
      # Start a worker by calling: UserCatsRef.Worker.start_link(arg)
      # {UserCatsRef.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: UserCatsRef.Supervisor)
  end
end
