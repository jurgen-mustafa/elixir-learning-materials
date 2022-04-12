defmodule Crudopdracht.Repo do
  use Ecto.Repo,
    otp_app: :crudopdracht,
    adapter: Ecto.Adapters.MyXQL
end
