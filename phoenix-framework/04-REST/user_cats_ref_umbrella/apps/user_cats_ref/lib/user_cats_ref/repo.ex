defmodule UserCatsRef.Repo do
  use Ecto.Repo,
    otp_app: :user_cats_ref,
    adapter: Ecto.Adapters.MyXQL
end
