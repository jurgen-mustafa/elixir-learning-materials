defmodule UserCatsRef.CatContext.Cat do
  use Ecto.Schema
  import Ecto.Changeset

  alias UserCatsRef.UserContext.User

  schema "cats" do
    field(:name, :string)
    belongs_to(:user, User)

    # We will not use the timestamps, if you want to delete this dont forget to delete it in the migrations
    timestamps()
  end

  @doc false
  def changeset(cat, attrs) do
    cat
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create_changeset(cat, attrs, user) do
    cat
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> put_assoc(:user, user)
  end
end
