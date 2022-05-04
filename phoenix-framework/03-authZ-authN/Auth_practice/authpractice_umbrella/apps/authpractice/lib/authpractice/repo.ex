defmodule Authpractice.Repo do
  use Ecto.Repo,
    otp_app: :authpractice,
    adapter: Ecto.Adapters.MyXQL
end
