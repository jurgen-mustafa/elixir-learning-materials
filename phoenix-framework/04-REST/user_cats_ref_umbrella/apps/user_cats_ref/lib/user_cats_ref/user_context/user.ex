defmodule UserCatsRef.UserContext.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias UserCatsRef.CatContext.Cat

  schema "users" do
    field(:date_of_birth, :date)
    field(:first_name, :string)
    field(:last_name, :string)
    has_many(:cats, Cat)

    # We will not use the timestamps, if you want to delete this dont forget to delete it in the migrations
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :date_of_birth])
    |> validate_required([:first_name, :last_name, :date_of_birth])
  end
end
